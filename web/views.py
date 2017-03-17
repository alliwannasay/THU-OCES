from django.shortcuts import render, render_to_response
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from django.conf import settings
import os
from django.utils import timezone
import json
from django.http import HttpResponse
from django.views.generic import View
from codex.baseerror import *
import urllib.request
from django.contrib import auth
from .models import *
from django.views.generic.detail import *
from django.views.generic.list import *
from django.core.urlresolvers import reverse
from .forms import *
import requests
import random
import requests
from django.db.models import Q
import importlib
import sys

# Create your views here.

gpb_amount = {
        'post': 100,
        'get_liked': 10,
        'reply': 20,
        'wanted': 200,
    }


type_dic = {
    '普通贴':0,
    '提问贴':1,
    '笔记贴':2,
    '回答贴':3,
    '大讨论区':4,
}

def readFile():
    importlib.reload(sys)
    f = open("info.txt", 'r', encoding='gbk')
    lines = f.readlines()
    print(lines[len(lines) - 1])
    f.close()

def raiseLevel(myuser):
    curlevel = myuser.U_Level
    curgpb = myuser.U_GPB
    thislevelgpb = curlevel*20
    while curgpb >= thislevelgpb:
        myuser.U_Level = myuser.U_Level + 1
        myuser.save()
        thislevelgpb = (myuser.U_Level)*20
    if myuser.U_Level <= 20:
        myuser.U_Honor = "不起眼女主"
    elif myuser.U_Level > 20 and myuser.U_Level <= 40:
        myuser.U_Honor = "咕咕咕"
    elif myuser.U_Level > 40 and myuser.U_Level <= 60:
        myuser.U_Honor = "伊豆的舞女"
    elif myuser.U_Level > 60 and myuser.U_Level <= 80:
        myuser.U_Honor = "清华鸽王"
    elif myuser.U_Level > 80 and myuser.U_Level <= 100:
        myuser.U_Honor = "学堂学家"
    elif myuser.U_Level > 100:
        myuser.U_Honor = "超絶かわいい"
    myuser.save()

def get_courses(user):
    myuser = BBSUser.objects.get(user=user)
    relas = UserHasCourse.objects.filter(UserID=myuser);
    courses = []
    for rela in relas:
        courses.append(rela.CourseID)
    return courses

def get_dislike_courses(myuser):
    disRelas = UserDislikeCourse.objects.filter(UserID=myuser)
    courses = []
    for rela in disRelas:
        courses.append(rela.CourseID)
    return courses

def get_recommended_courses(myuser,mycourses):
    allcourses = BBSCourse.objects.all()
    dcourses = get_dislike_courses(myuser)
    remainCourses = []
    for course in allcourses:
        if course in mycourses:
            continue
        if course in dcourses:
            continue
        remainCourses.append(course)
    return remainCourses[0:9]

def get_hot_courses(myuser):
    allcourses = BBSCourse.objects.all()
    allcourses = allcourses.order_by('-C_Ranknum')
    dcourses = get_dislike_courses(myuser)
    remainCourses = []
    for course in allcourses:
        if course in dcourses:
            continue
        remainCourses.append(course)
    remainCourses.reverse()
    return remainCourses[0:9]

def get_best_comment(course):
    posts = BBSPost.objects.filter(P_Course=course)
    posts = posts.order_by('-P_LikeNum')
    if len(posts) == 0:
        return "无短评"
    bestpost = posts[0]
    return bestpost.P_Content

class newBind:
    course = BBSCourse()
    shortmsg = ""
    hyaku = 0
    def __init__(self,c,s):
        self.course = c
        self.shortmsg = s
        self.hyaku = self.course.C_Rank * 100 / 5.0

    def __iter__(self):
        print("__iter__ called")
        return iter(self.shortmsg)

def bind_course_comment(courses):
    bindresult = []
    for i in range(0,len(courses)):
        comment = get_best_comment(courses[i])
        nB = newBind(courses[i],comment)
        bindresult.append(nB)
    bindresult.reverse()
    return bindresult

def get_my_comment(myuser,course):
    myposts = BBSPost.objects.filter(P_Course=course,P_User=myuser)
    if len(myposts) == 0:
        return "尚未点评"
    return myposts[0].P_Content




def bbs_list(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    myuser = BBSUser.objects.get(user=request.user)
    recCourses = get_recommended_courses(myuser,courses)
    hotCourses = get_hot_courses(myuser)
    recBind = bind_course_comment(recCourses)
    hotBind = bind_course_comment(hotCourses)
    print('test',hotBind)
    labelstr = get_label_str(request.user)
    #readFile()
    return render(request, 'index.html',{'courses':courses,'hotBind':hotBind,'recBind':recBind,'user':myuser,'label':labelstr})


def validate_user_bymyself(request,studentid,password):
    test_data = {'i_user': studentid, 'i_pass': password}
    test_data_urlencode = urllib.parse.urlencode(test_data).encode("utf-8")
    requrl = "https://id.tsinghua.edu.cn/do/off/ui/auth/login/post/fa8077873a7a80b1cd6b185d5a796617/0?/j_spring_security_thauth_roaming_entry"
    req = urllib.request.Request(url=requrl, data=test_data_urlencode)
    f = urllib.request.urlopen(req).read().decode('utf8')
    if len(f) >= 2000:
        users = BBSUser.objects.filter(U_studentid=studentid)
        if len(users) == 0:
            newUserSys = User.objects.create_user(username=studentid, password=password)
            newUserSys.save()
            newUserSys = auth.authenticate(username=studentid, password=password)
            auth.login(request, newUserSys)
            newUser = BBSUser()
            newUser.U_studentid = studentid
            newUser.U_password = password
            newUser.user = newUserSys
            newUser.save()
            return newUser
        else:
            newUserSys = auth.authenticate(username=studentid, password=password)
            auth.login(request, newUserSys)
            return users[0]

def login(request):
    if request.user.is_authenticated():
        return HttpResponseRedirect("/")
    if request.method == 'POST':
        studentidin = request.POST['studentid']
        passwordin = request.POST['password']
        if not studentidin:
            return render(request, "web/login.html", {'error': "请输入学号"})
        elif not passwordin:
            return render(request, "web/login.html", {'error': "请输入密码"})

        user = auth.authenticate(username=studentidin, password=passwordin)
        if user is not None:
            auth.login(request, user)
            return HttpResponseRedirect('/instruction')
        else:
            user = validate_user_bymyself(request,studentid=studentidin, password=passwordin)
            if user is not None:
                if user.U_NewUser == 1:
                    return HttpResponseRedirect("/instruction/")
                else:
                    return HttpResponseRedirect('/')
            else:
                return render(request, "web/login.html", {'error': "学号或密码不正确"})
    else:
        return render(request, "web/login.html")

def instruction(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    myuser = BBSUser.objects.get(user=request.user)
    param = myuser.U_studentid
    if request.method == 'POST':
        return HttpResponseRedirect("/change_label/" + str(param) + "/")
    
    return render(request, 'web/instruction.html',{'courses':courses,'user':myuser,})

def bindHyaku(courses):
    nBlist = []
    for course in courses:
        nB = newBind(course,get_best_comment(course))
        nBlist.append(nB)
    return nBlist

def course_post_list(request,courseid):
    context = {}
    mycourse = BBSCourse.objects.get(id=courseid)
    hasnotes = 0
    isHaving = 1
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    if mycourse not in courses:
        isHaving = 0

    myuser = BBSUser.objects.get(user=request.user)
    # posts = BBSPost.objects.filter(P_Course=mycourse, P_Parent=None)

    # posts = list(posts)

    # newposts = []
    # for post in posts:
    #     if post.P_Type == type_dic['大讨论区']:
    #         continue
    #     newposts.append(post)
    #
    # newposts.reverse()

    isLike = 0
    ulcf = UserLikeCourse.objects.filter(CourseID=mycourse,UserID=myuser)
    if len(ulcf)!=0:
        isLike = 1
    # context['posts'] = newposts
    context['course'] = mycourse
    context['user'] = myuser
    context['isHaving'] = isHaving
    context['isLike'] = isLike
    context['courseBind'] = newBind(mycourse,get_best_comment(mycourse))
    return render(request,'web/course_bbs_list.html',context)



def course_post_detail(request,courseid,postid):
    thiscourse = BBSCourse.objects.get(id=courseid)
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)


    myuser = BBSUser.objects.get(user=request.user)
    bigpost = BBSPost.objects.get(id=postid, P_Course=thiscourse)
    if bigpost.P_Type == type_dic['笔记贴'] and len(UserHasNode.objects.filter(UserID=myuser,PostID=bigpost))==0:
        return HttpResponseRedirect('/login/')

    params = request.POST if request.method == 'POST' else None

    form = ReplyForm(params,instance=None)
    if form.is_valid():
        reply_get = form.save(commit=False)
        reply = BBSPost()
        reply.P_User = myuser
        reply.P_Title = '回复'
        reply.P_Content = reply_get.P_Content
        reply.P_Course = thiscourse
        reply.P_Type = type_dic['回答贴']
        reply.P_Parent = bigpost
        reply.save()
        bigpost.P_ReplyNum += 1
        bigpost.save()
        myuser.U_GPB += gpb_amount['reply']
        raiseLevel(myuser)
        myuser.save()
        form = ReplyForm(params,instance=None)

    childrenpostsq = BBSPost.objects.filter(P_Parent=bigpost)
    childrenposts=[]
    bestchild = None
    for child in childrenpostsq:
        if child != bigpost.P_BestChild:
            childrenposts.append(child)
        else :
            bestchild = child
    childrenposts.reverse()
    if bestchild != None:
        childrenposts.append(bestchild)
    childrenposts.reverse()
    #childrenposts.reverse()

    likefilter = UserLikePost.objects.filter(UserID=myuser, PostID=bigpost)
    islike = 0
    if len(likefilter) != 0:
        islike = 1
    context = {}
    context['bigpost'] = bigpost
    context['course'] = thiscourse
    context['user'] = myuser
    context['childrenposts'] = childrenposts
    context['islike'] = islike
    context['form'] = form

    context['courses'] = courses
    return render(request,'web/course_bbs_detail.html',context)

def get_label(user):
    myuser = BBSUser.objects.get(user=user)
    relas = UserFollowLabel.objects.filter(UserID=myuser);
    labels = []
    for rela in relas:
        labels.append(rela.LabelID)
    return labels

def get_label_str(user):
    labels = get_label(user)
    labelname = ''
    for label in labels:
        labelname += str(label)
        labelname += ','
    labelname = labelname[:-1]
    return labelname


def user_self_info(request, param, action):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    visitedUser = User.objects.get(username=param)
    visitedUser = BBSUser.objects.get(user=visitedUser)
    courses = get_courses(request.user)
    #userme = BBSUser.objects.get(user=request.user)
    #courses = get_courses(request.user)
    labelname = get_label_str(request.user)
    
    if request.method == 'POST':
        ischange = request.POST.get('changelabel', None)
        issetting = request.POST.get('setting', None)
        ismyclass = request.POST.get('myclass',None)
        #print(ischange == None)
        if not ischange == None:
            return HttpResponseRedirect("/change_label/" + str(param) + "/")
        elif not issetting == None:
            return HttpResponse("<h1>Settings</h1>")
        elif not ismyclass == None:
            return HttpResponseRedirect("/my_class/" + str(param) + "/")
    
    return render(request,'web/user_self_info.html',{'user':visitedUser, 'courses':courses, 'label':labelname })

def user_change_label(request, param):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    visitedUser = User.objects.get(username=param)
    visitedUser = BBSUser.objects.get(user=visitedUser)
    courses = get_courses(request.user)
    
    mylabels = get_label(request.user)
    # labelnames = []
    # for label in labels:
    #     labelnames.append(str(label))
    #
    # labelnames_un = []
    
    labels = CourseLabel.objects.all()
    # for label in labels:
    #     if not (label.L_Name in labelnames):
    #         labelnames_un.append(label.L_Name)
    # if request.method == 'POST':
    #     #print("post")
    #     isdelete = request.POST.get('delete', None)
    #     isadd = request.POST.get('add', None)
    #     isnext = request.POST.get('next', None)
    #     if not isnext == None:
    #         visitedUser.U_NewUser = 0
    #         visitedUser.save()
    #         return HttpResponseRedirect('/')
    #     elif not isdelete == None:
    #         #print("delete")
    #         #print(request.POST.get('labels_followed', None))
    #         la = CourseLabel.objects.get(L_Name = request.POST.get('labels_followed', None))
    #         UserFollowLabel.objects.get(UserID = visitedUser, LabelID = la).delete()
    #     elif not isadd == None:
    #         #print("add")
    #         #print(request.POST.get('labels_unfollowed', None))
    #         la = CourseLabel.objects.get(L_Name = request.POST.get('labels_unfollowed', None))
    #         UserFollowLabel.objects.create(UserID = visitedUser, LabelID = la)
    #
    #     return HttpResponseRedirect("/change_label/" + str(param) + "/")
    #
    if request.method == 'POST':
        print(request.POST)
        dict = request.POST
        key = 'labelsubmit'
        labelids = dict.getlist(key)
        orire = UserFollowLabel.objects.filter(UserID=visitedUser)
        orire.delete()

        for labelid in labelids:
            newlabel = CourseLabel.objects.get(id = int(labelid))

            UserFollowLabel.objects.create(UserID = visitedUser,LabelID = newlabel)
        return HttpResponseRedirect("/")

    return render(request,'web/user_change_label.html',
                  {'user':visitedUser, 'courses':courses, 'labels':labels, 'mylabels':mylabels})

def my_class_new(request, param):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    visitedUser = User.objects.get(username=param)
    visitedUser = BBSUser.objects.get(user=visitedUser)
    courses = get_courses(request.user)
    
    course_with_score = UserHasCourse.objects.filter(UserID = visitedUser)
    courses_eva = []
    courses_uneva = []
    courses_com = []
    myuser = BBSUser.objects.get(user=request.user)
    
    for course in course_with_score:
        mycomment = get_my_comment(myuser, course.CourseID)
        if course.Score == -1:
            li = [course.CourseID.C_Name, course.CourseID.C_Name+'eva',mycomment, course.CourseID.id]
            courses_uneva.append(li)
        else:
            li = [course.CourseID.C_Name, course.CourseID.C_Name+'eva',course.Score,mycomment, course.CourseID.id]
            courses_eva.append(li)

    for course in course_with_score:
        mycomment = get_my_comment(myuser, course.CourseID)
        if mycomment != "尚未点评":
            li = [course.CourseID.C_Name, course.CourseID.C_Name + 'eva', mycomment, course.CourseID.id]
            courses_com.append(li)
            
    # if request.method == 'POST':
    #     if request.POST.get('returnid') != None:
    #         coursenamepost = request.POST.get('returnid')
    #         thiscourse = BBSCourse.objects.filter(C_Name=coursenamepost)
    #         print(thiscourse)
            #return HttpResponseRedirect('/course/' + str(course.id) + '/')
        #print(request.POST['returnid'])
        # for course in courses:
        #     print(request.POST.get(course.C_Name))
        #     if not request.POST.get(course.C_Name, None) == None:
        #         return HttpResponseRedirect('/course/'+str(course.id)+'/')
        # for course in courses_uneva:
        #     # if not request.POST.get(course[1], None) == None:
        #     courseid = BBSCourse.objects.get(C_Name = course[0]).id
        #     return HttpResponseRedirect("/course_evaluation/" + str(param) + "/" + str(courseid) + '/')
    
    return render(request, 'web/my_class.html',
                  {'user':visitedUser, 'courses':courses, 
                   'courses_eva': courses_eva, 'courses_uneva': courses_uneva, 'courses_com':courses_com})

class signBind:
    course = BBSCourse()
    sign = 0
    hyaku = 0
    shortmsg = ""
    def __init__(self,c,s,sm):
        self.course = c
        self.sign = s
        self.shortmsg = sm
        self.hyaku = self.course.C_Rank * 100 / 5.0

    def __iter__(self):
        print("__iter__ called")
        return iter(self.sign)

def hasEva(myuser,course):
    re = UserHasCourse.objects.get(UserID=myuser,CourseID=course)
    if re.Score == -1:
        return False
    return True

def hasCom(myuser,course):
    mycomment = get_my_comment(myuser, course)
    if mycomment == "尚未点评":
        return False
    return True


def my_class(request,param):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    visitedUser = User.objects.get(username=param)
    myuser = BBSUser.objects.get(user=visitedUser)
    courses = get_courses(request.user)
    sBlist = []
    for course in courses:
        newsign = 0
        hasEvaBo = hasEva(myuser,course)
        hasComBo = hasCom(myuser,course)
        if hasEvaBo and hasComBo:
            newsign = 3
        elif hasEvaBo and (not hasComBo):
            newsign = 2
        elif (not hasEvaBo) and hasComBo:
            newsign = 1
        else:
            newsign = 0
        sB = signBind(course,newsign,get_best_comment(course))
        sBlist.append(sB)
    return render(request, 'web/my_class.html',
                  {'user':myuser, 'courses':courses, 'coursesBinds': sBlist})


def course_evaluation(request, param, courseid):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    course = BBSCourse.objects.get(id=courseid)
    if course not in courses:
        return HttpResponseRedirect('/')
    myuser = BBSUser.objects.get(user=request.user)
    
    
    if request.method == "POST":
        if not request.POST.get('eva', None) == None:
            print("POST eva")
            
            title = request.POST['P_Title'] if request.POST['P_Title'] else ""
            content = request.POST['P_Content'] if request.POST['P_Content'] else ""
            wantedvalue = 0
            realtype = 0 #增加帖子类型后可在此修改
            Score = int(request.POST.get('Score', None))
            if not title:
                return render(request,'web/course_evaluation.html',{'user':myuser, 'error':'请输入评论题目，并修正评分','P_Title':title,'P_Content':content,'course':course, 'courses':courses})
            if not content:
                return render(request,'web/course_evaluation.html',{'user':myuser, 'error':'请输入评论详情，并修正评分','P_Title':title,'P_Content':content,'course':course, 'courses':courses})
            
            UHC = UserHasCourse.objects.get(UserID = myuser, CourseID = course)
            UHC.Score = Score
            UHC.save()

            course.C_Ranknum += 1
            course.C_Rank = (course.C_Rank*(course.C_Ranknum-1)+Score)/course.C_Ranknum
            course.save()
            
            title = '【课程评价】' + title + '【评分：' + str(Score) + '.0/5.0】'
    
            post = BBSPost()
            post.P_User = myuser
            post.P_Title = title
            post.P_Content = content
            post.P_Course = course
            post.P_Type = realtype
            post.P_Wanted = wantedvalue
            post.save()
            myuser.U_GPB += gpb_amount['post']
            raiseLevel(myuser)
            myuser.save()
            if myuser.U_NewUser == 1:
                return HttpResponseRedirect("/change_label/" + myuser.U_studentid + "/")
            else:
                return HttpResponseRedirect('/my_class/' + myuser.U_studentid + '/')

    re = UserHasCourse.objects.get(UserID=myuser,CourseID=course)
    nB = newBind(course,re.Term)
    return render(request, 'web/course_evaluation.html', {'user':myuser,'course':course, 'courseBind':nB,'courses':courses})

@csrf_exempt
def like_post_deal(request):
    userme = BBSUser.objects.get(user=request.user)
    post = BBSPost.objects.get(id=int(request.POST['postID']))
    postuser = BBSUser.objects.get(id=post.P_User.id)
    if UserLikePost.objects.filter(UserID=userme.id, PostID=post).exists():
        UserLikePost.objects.get(UserID=userme.id, PostID=post).delete()
        post.P_LikeNum -= 1
        post.save()
        postuser.U_GPB -= gpb_amount['get_liked']
        postuser.save()
    else:
        newLikePost = UserLikePost()
        newLikePost.UserID = userme
        newLikePost.PostID = post
        newLikePost.save()
        post.P_LikeNum += 1
        post.save()
        postuser.U_GPB += gpb_amount['get_liked']
        raiseLevel(postuser)
        postuser.save()

    return HttpResponse('follow success')

@csrf_exempt
def like_course(request):
    myuser = BBSUser.objects.get(user=request.user)
    course = BBSCourse.objects.get(id=int(request.POST['courseID']))

    if UserLikeCourse.objects.filter(UserID=myuser, CourseID=course).exists():
        UserLikeCourse.objects.get(UserID=myuser, CourseID=course).delete()
    else:
        print("shit")
        newLikeCourse = UserLikeCourse()
        newLikeCourse.UserID = myuser
        newLikeCourse.CourseID = course
        print(newLikeCourse)
        newLikeCourse.save()

    return HttpResponse('follow success')


@csrf_exempt
def post_course_post(request,courseid):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    course = BBSCourse.objects.get(id=courseid)
    courses = get_courses(request.user)
    if course not in courses:
        return HttpResponseRedirect('/')
    myuser = BBSUser.objects.get(user=request.user)
    if request.method == 'POST':
        title = request.POST['P_Title'] if request.POST['P_Title'] else ""
        content = request.POST['P_Content'] if request.POST['P_Content'] else ""
        wantedvalue = request.POST['wantedval'] if request.POST['wantedval'] else 0
        realtype = request.POST['Realtype'] if request.POST['Realtype'] else 0
        if not title:
            return render(request,'web/post_post.html',{'error':'请输入帖子题目','P_Title':title,'P_Content':content,'course':course, 'courses':courses})
        if not content:
            return render(request,'web/post_post.html',{'error':'请输入帖子详情','P_Title':title,'P_Content':content,'course':course, 'courses':courses})


        userme = BBSUser.objects.get(user=request.user)

        post = BBSPost()
        post.P_User = userme
        post.P_Title = title
        post.P_Content = content
        post.P_Course = course
        post.P_Type = realtype
        post.P_Wanted = wantedvalue
        post.save()
        userme.U_GPB += gpb_amount['post']
        raiseLevel(userme)
        userme.save()
        return HttpResponseRedirect(reverse('course',args=[courseid]))
    return render(request, 'web/post_post.html', {'user':myuser,'course':course, 'courses':courses})



def delete_post(request,courseid,postid,parentid):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    mycourse = BBSCourse.objects.get(id=courseid)
    courses = get_courses(request.user)
    if mycourse not in courses:
        return HttpResponseRedirect('/')
    postde = BBSPost.objects.get(id=postid)
    likes = UserLikePost.objects.filter(PostID=postde)
    follows = UserFollowPost.objects.filter(PostID=postde)
    for like in likes:
        like.delete()
    for follow in follows:
        follow.delete()
    postde.delete()
    myuser = BBSUser.objects.get(user=request.user)
    myuser.U_GPB -= gpb_amount['reply']
    myuser.save()
    return HttpResponseRedirect("/course/"+str(courseid)+"/post/"+str(parentid)+"/")

def delete_bigpost(request,courseid,postid):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    mycourse = BBSCourse.objects.get(id=courseid)
    courses = get_courses(request.user)
    print('delete',mycourse.C_Name)
    if mycourse not in courses:
        return HttpResponseRedirect('/')
    postde = BBSPost.objects.get(id=postid)
    likes = UserLikePost.objects.filter(PostID=postde)
    follows = UserFollowPost.objects.filter(PostID=postde)
    for like in likes:
        like.delete()
    for follow in follows:
        follow.delete()
    postde.delete()
    myuser = BBSUser.objects.get(user=request.user)
    myuser.U_GPB -= gpb_amount['post']
    myuser.save()
    return HttpResponseRedirect("/course/" + str(courseid) + "/")


def logout(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    if request.user.is_authenticated():
        auth.logout(request)
        return HttpResponseRedirect('/login/')
    else:
        return HttpResponseRedirect('/login/')

@csrf_exempt
def good_post(request,courseid,bigpostid):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    mycourse = BBSCourse.objects.get(id=courseid)
    courses = get_courses(request.user)
    if mycourse not in courses:
        return HttpResponseRedirect('/')
    if request.method == 'POST':
        goodpostid = int(request.POST['postID'])
        parentid = int(request.POST['parentID'])
        goodpost = BBSPost.objects.get(id=goodpostid)
        parent = BBSPost.objects.get(id=parentid)
        if parent.P_BestChild != None:
            if parent.P_BestChild == goodpost:
                parent.P_BestChild.P_User.U_GPB -= parent.P_Wanted
                parent.P_BestChild.P_User.save()
                parent.P_BestChild = None
                parent.save()
                return HttpResponseRedirect("/course/"+courseid+"/post/"+bigpostid+"/")
            else:
                parent.P_BestChild.P_User.U_GPB -= parent.P_Wanted
                parent.P_BestChild.P_User.save()
        parent.P_BestChild = goodpost
        parent.save()
        goodpost.P_User.U_GPB += parent.P_Wanted
        raiseLevel(goodpost.P_User)
        goodpost.P_User.save()
        parent.P_User.U_GPB -= parent.P_Wanted
        parent.P_User.save()
        return HttpResponseRedirect("/course/" + courseid + "/post/" + bigpostid + "/")
    return HttpResponseRedirect("/course/"+courseid+"/post/"+bigpostid+"/")

def my_like_courses(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    myuser = BBSUser.objects.get(user=request.user)
    mylikecoursesre = UserLikeCourse.objects.filter(UserID=myuser)
    mylikecourses = []
    for i in mylikecoursesre:
        mylikecourses.append(i.CourseID)
    return render(request, 'web/my_like_courses.html', {'user':myuser,'courses':mylikecourses})


@csrf_exempt
def ajax_append_image(request):
    data = request.FILES['file']
    path = default_storage.save(data.name, ContentFile(data.read()))
    return HttpResponse(path)

@csrf_exempt
def ajax_change_image(request):
    file = request.FILES if request.method == 'POST' else None
    bbsuser = BBSUser.objects.get(user=request.user)
    if file:
        bbsuser.U_Image = file['file']
        bbsuser.save()
    return HttpResponse(bbsuser.U_Image)

@csrf_exempt
def ajax_change_nickname(request):
    bbsuser = BBSUser.objects.get(user=request.user)
    bbsuser.U_name = request.POST['newNick']
    bbsuser.save()
    return  HttpResponse("修改成功")


@csrf_exempt
def dislike_course(request):
    myuser = BBSUser.objects.get(user=request.user)
    dcourse = BBSCourse.objects.get(id=int(request.POST['courseID']))
    newrela = UserDislikeCourse(UserID=myuser,CourseID=dcourse)
    newrela.save()
    return HttpResponseRedirect("/")

def search_course(request):
    courses = get_courses(request.user)
    myuser = BBSUser.objects.get(user=request.user)
    coursesall = BBSCourse.objects.all()
    if request.method == 'POST':
        searchContent = request.POST["searchContent"]
        print(searchContent)
        # coursesres = BBSCourse.objects.all().filter(Q(C_Name=searchContent)|Q(C_SeqNum=searchContent))
        coursesres = search_course_by_name(coursesall,searchContent)
        print(coursesres)
    return render(request, 'web/search_result.html', {'user': myuser, 'search_courses': coursesres, 'courses': courses})

def search_course_by_name(coursesall,searchcontent):
    result = []
    rescourse = []
    for course in coursesall:
        occur_num = kmp_practice(course.C_Name+course.C_SeqNum,searchcontent)
        if occur_num != 0:
            result.append((occur_num,course.id))
    result = sorted(result)
    for res in result:
        thisid = res[1]
        thiscourse = BBSCourse.objects.get(id=thisid)
        rescourse.append(thiscourse)
    rescourse.reverse()
    return rescourse


def kmp_next(base,next):
  i=0
  j=-1
  next[0]=-1
  while base[i]!='\0':
    if j==-1 or base[i]==base[j]:
      i=i+1
      j=j+1
      if base[i]==base[j]:
        next[i]=next[j]
      else:
        next[i]=j
    else:
      j=next[j]
  return 0


def kmp(b,base,pos,next):
  i=pos-1
  j=0
  while b[i]!='\0' and base[j]!='\0':
    if b[i]==base[j]:
      i=i+1
      j=j+1
    else:
      j=next[j]
      if j==-1:
        i=i+1
        j=j+1
  if base[j]=='\0':
    return i-j+1
  else:
    return -1


def kmp_practice(b,base):
  next=[-1]*1000
  occur_num = 0
  pos=0
  base = base + '\0'
  b = b + '\0'
  kmp_next(base,next)
  while 1:
    pos=kmp(b,base,pos+1,next)
    if pos==-1:
      return occur_num
    occur_num += 1
  return occur_num


