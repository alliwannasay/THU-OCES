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
        'post': 30,
        'score':10,
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

def modifyUsers():
    users = BBSUser.objects.all()
    for u in users:
        u.U_NewUser = 1
        u.save()


def createUsers():
    # for i in range(0,150):
    #     tmpStudentid = "user"+str(i)
    #     tmpPassword = "pwd"+str(i)
    #     newUserSys = User.objects.create_user(username=tmpStudentid, password=tmpPassword)
    #     newUserSys.save()
    #     # newUserSys = auth.authenticate(username=tmpStudentid, password=password)
    #     # auth.login(request, newUserSys)
    #     newUser = BBSUser()
    #     newUser.U_studentid = tmpStudentid
    #     newUser.user = newUserSys
    #     newUser.save()

    users = BBSUser.objects.all()
    course1 = BBSCourse.objects.get(C_Name="概率论")
    course2 = BBSCourse.objects.get(C_Name="建模与仿真")
    course3 = BBSCourse.objects.filter(C_Name="工程经济学")[0]
    for i in range(60, 150):
        tmpStudentid = "user" + str(i)
        thisuser = BBSUser.objects.get(U_studentid=tmpStudentid)
        newrela = UserHasCourse()
        newrela.UserID = thisuser
        newrela.CourseID = course1
        newrela.save()
        newrela = UserHasCourse()
        newrela.UserID = thisuser
        newrela.CourseID = course2
        newrela.save()
        newrela = UserHasCourse()
        newrela.UserID = thisuser
        newrela.CourseID = course3
        newrela.save()
    for i in range(0, 60):
        tmpStudentid = "user" + str(i)
        thisuser = BBSUser.objects.get(U_studentid=tmpStudentid)
        newrela = UserHasCourse()
        newrela.UserID = thisuser
        newrela.CourseID = course1
        newrela.save()

    # relas = UserHasCourse.objects.all()
    # relas.delete()



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
    relas = UserHasCourse.objects.filter(UserID=myuser)
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
        self.hyaku = float(self.course.C_Rank) * 100 / 5.0

    def __iter__(self):
        print("__iter__ called")
        return iter(self.shortmsg)

class myRankBind:
    course = BBSCourse()
    rank = 0
    shortmsg = ""
    hyaku = 0
    def __init__(self,c,r,s):
        self.course = c
        self.rank = r
        self.shortmsg = s
        self.hyaku = self.rank * 100 / 5.0

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
    myposts = BBSPost.objects.filter(P_Course=course,P_User=myuser,P_Parent=None)
    if len(myposts) == 0:
        return "尚未点评"
    return myposts[0].P_Content

def getAssignedCourses():
    courses = []
    course1 = BBSCourse.objects.get(C_Name="概率论")
    course2 = BBSCourse.objects.get(C_Name="建模与仿真")
    course3 = BBSCourse.objects.filter(C_Name="工程经济学")[0]
    courses.append(course1)
    courses.append(course2)
    courses.append(course3)
    return courses


def bbs_list(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    # recCourses = get_recommended_courses(myuser,courses)
    # hotCourses = get_hot_courses(myuser)
    recCourses = getAssignedCourses()
    hotCourses = getAssignedCourses()
    recBind = bind_course_comment(recCourses)
    hotBind = bind_course_comment(hotCourses)
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
            print(user)
            if(request.user.username == "test"):
                return HttpResponseRedirect("/instruction/")
            return HttpResponseRedirect('/')
        else:

            user = validate_user_bymyself(request,studentid=studentidin, password=passwordin)
            if user is not None:
                return HttpResponseRedirect("/instruction/")
            # if user is not None:
            #     if user.U_NewUser == 1:
            #         return HttpResponseRedirect("/instruction/")
            #     else:
            #         return HttpResponseRedirect('/')
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
        return HttpResponseRedirect("/instruction_my_class/")
    
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
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
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

class postBind:
    post = BBSPost()
    rank = 0
    hyaku = 0
    isLike = 0
    isDislike = 0
    def __init__(self,user,thispost,r):
        self.post = thispost
        self.rank = r
        self.hyaku = self.rank * 100 / 5.0
        self.isLike = 1
        self.isDislike = 1
        if len(UserLikePost.objects.filter(UserID=user, PostID=thispost)) == 0:
            self.isLike = 0
        if len(UserDislikePost.objects.filter(UserID=user, PostID=thispost)) == 0:
            self.isDislike = 0

    def __iter__(self):
        print("__iter__ called")
        return iter(self.rank)

def course_posts(request,courseid):
    context = {}
    mycourse = BBSCourse.objects.get(id=courseid)
    isHaving = 1
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    if mycourse not in courses:
        isHaving = 0
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    posts = BBSPost.objects.filter(P_Course=mycourse, P_Parent=None)
    timeposts = list(posts)

    timepBlist = []
    for tp in timeposts:
        re = UserHasCourse.objects.get(UserID=tp.P_User,CourseID=mycourse)
        pB = postBind(myuser,tp,re.Score)
        timepBlist.append(pB)
    timepBlist.reverse()

    likepBlist = sorted(timepBlist,key=lambda rank : rank.post.P_LikeNum,reverse=True)
    context['timepBs'] = timepBlist
    context['likepBs'] = likepBlist
    context['isHaving'] = isHaving
    context['course'] = mycourse
    context['user'] = myuser
    return render(request, 'web/course_posts.html', context)

class likeBind:
    post = BBSPost()
    isLike = 0
    isDislike = 0
    def __init__(self,user,thispost):
        self.post = thispost
        self.isLike = 1
        self.isDislike = 1
        if len(UserLikePost.objects.filter(UserID=user,PostID=thispost)) == 0:
            self.isLike = 0
        if len(UserDislikePost.objects.filter(UserID=user,PostID=thispost)) == 0:
            self.isDislike = 0

    def __iter__(self):
        print("__iter__ called")
        return iter(self.isLike)

@csrf_exempt
def course_post_detail(request,courseid,postid):
    thiscourse = BBSCourse.objects.get(id=courseid)
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)


    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    bigpost = BBSPost.objects.get(id=postid, P_Course=thiscourse)

    if request.method == 'POST':
        newContent = request.POST['com']
        newPost = BBSPost(P_User=myuser,P_Course=thiscourse,P_Parent=bigpost,P_Content=newContent)
        newPost.save()
        bigpost.P_ReplyNum += 1
        bigpost.save()
        return HttpResponseRedirect("/course/"+str(thiscourse.id)+"/post/"+str(bigpost.id)+"/")


    childrenpostsq = BBSPost.objects.filter(P_Parent=bigpost)
    bindChildrenPosts=[]

    for child in childrenpostsq:
        bindChildrenPosts.append(likeBind(myuser,child))
    bindChildrenPosts.reverse()

    context = {}
    context['bigpost'] = bigpost
    context['course'] = thiscourse
    context['user'] = myuser
    context['childrenposts'] = bindChildrenPosts

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
    if visitedUser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
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
    
    labels = CourseLabel.objects.all()

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
        if visitedUser.U_NewUser == 0:
            visitedUser.U_NewUser = 1
            visitedUser.save()
        return HttpResponseRedirect("/")

    return render(request,'web/user_change_label.html',
                  {'user':visitedUser, 'courses':courses, 'labels':labels, 'mylabels':mylabels})

def my_class_old(request, param):
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
    rank = 0
    hyaku = 0
    shortmsg = ""

    def __init__(self,c,s,r,sm):
        self.course = c
        self.sign = s
        self.rank = r
        self.shortmsg = sm
        self.hyaku = self.rank * 100 / 5.0

    def __iter__(self):
        print("__iter__ called")
        return iter(self.sign)

def hasEva(myuser,course):
    re = UserHasCourse.objects.filter(UserID=myuser,CourseID=course)[0]
    if re.Score == -1:
        return False
    return True

def hasCom(myuser,course):
    mycomment = get_my_comment(myuser, course)
    if mycomment == "尚未点评":
        return False
    return True

def getScore(myuser,course):
    re = UserHasCourse.objects.filter(UserID=myuser,CourseID=course)[0]
    return re.Score




def my_class(request,param):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    visitedUser = User.objects.get(username=param)
    myuser = BBSUser.objects.get(user=visitedUser)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
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
        sB = signBind(course,newsign,getScore(myuser,course),get_my_comment(myuser,course))
        sBlist.append(sB)
    return render(request, 'web/my_class.html',
                  {'user':myuser, 'courses':courses, 'coursesBinds': sBlist})

@csrf_exempt
def course_evaluation(request, param, courseid):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    course = BBSCourse.objects.get(id=courseid)
    if course not in courses:
        return HttpResponseRedirect('/')
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    if request.method == "POST":
        print(request.POST)
        oriposts = BBSPost.objects.filter(P_User=myuser,P_Course=course,P_Parent=None)
        if request.POST['com'] == "":
            oriposts.delete()
            myuser.U_GPB -= gpb_amount['post']
        elif len(oriposts) == 0:
            newpost = BBSPost(P_User=myuser,P_Course=course,P_Content=request.POST['com'])
            newpost.save()
            myuser.U_GPB += gpb_amount['post']
            myuser.save()
            course.C_Comnum += 1
            course.save()
        else:
            oriposts.delete()
            newpost = BBSPost(P_User=myuser, P_Course=course, P_Content=request.POST['com'])
            newpost.save()


        re = UserHasCourse.objects.get(UserID=myuser,CourseID=course)
        if re.Score == -1:
            course.C_Ranknum += 1
            re.Score = request.POST['score']
            course.C_Rank = (course.C_Rank * (course.C_Ranknum - 1) + int(request.POST['score'])) / course.C_Ranknum
            course.save()
            myuser.U_GPB += gpb_amount['score']
            print(gpb_amount['score'])
            myuser.save()
        else:
            oriScore = re.Score
            re.Score = request.POST['score']
            course.C_Rank = (course.C_Rank * (course.C_Ranknum) + int(request.POST['score']) - oriScore) / course.C_Ranknum
            course.save()
        re.save()
    re = UserHasCourse.objects.get(UserID=myuser,CourseID=course)
    nB = myRankBind(course,re.Score,get_my_comment(myuser,course))
    return render(request, 'web/course_evaluation.html', {'user':myuser,'course':course, 'courseBind':nB,'courses':courses})

@csrf_exempt
def like_course(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
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

#
# @csrf_exempt
# def post_course_post(request,courseid):
#     if not request.user.is_authenticated():
#         return HttpResponseRedirect('/login/')
#     course = BBSCourse.objects.get(id=courseid)
#     courses = get_courses(request.user)
#     if course not in courses:
#         return HttpResponseRedirect('/')
#     myuser = BBSUser.objects.get(user=request.user)
#     if request.method == 'POST':
#         title = request.POST['P_Title'] if request.POST['P_Title'] else ""
#         content = request.POST['P_Content'] if request.POST['P_Content'] else ""
#         wantedvalue = request.POST['wantedval'] if request.POST['wantedval'] else 0
#         realtype = request.POST['Realtype'] if request.POST['Realtype'] else 0
#         if not title:
#             return render(request,'web/post_post.html',{'error':'请输入帖子题目','P_Title':title,'P_Content':content,'course':course, 'courses':courses})
#         if not content:
#             return render(request,'web/post_post.html',{'error':'请输入帖子详情','P_Title':title,'P_Content':content,'course':course, 'courses':courses})
#
#
#         userme = BBSUser.objects.get(user=request.user)
#
#         post = BBSPost()
#         post.P_User = userme
#         post.P_Title = title
#         post.P_Content = content
#         post.P_Course = course
#         post.P_Type = realtype
#         post.P_Wanted = wantedvalue
#         post.save()
#         userme.U_GPB += gpb_amount['post']
#         raiseLevel(userme)
#         userme.save()
#         course.C_Comnum += 1
#         course.save()
#         return HttpResponseRedirect(reverse('course',args=[courseid]))
#     return render(request, 'web/post_post.html', {'user':myuser,'course':course, 'courses':courses})

@csrf_exempt
def like_child_post(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    if request.method == 'POST':
        print(request.POST)
        postid = request.POST['postID']
        newpost = BBSPost.objects.get(id=postid)
        testhave = UserLikePost.objects.filter(UserID=myuser,PostID=newpost)
        if len(testhave) == 0:
            newre = UserLikePost(UserID=myuser,PostID=newpost)
            newre.save()
            newpost.P_LikeNum += 1
            newpost.save()
            return HttpResponse(newpost.P_LikeNum)
        else:
            oldre = UserLikePost.objects.get(UserID=myuser, PostID=newpost)
            oldre.delete()
            newpost.P_LikeNum -= 1
            newpost.save()
            return HttpResponse(newpost.P_LikeNum)
    return HttpResponseRedirect("/")

@csrf_exempt
def dislike_child_post(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    if request.method == 'POST':
        print(request.POST)
        postid = request.POST['postID']
        newpost = BBSPost.objects.get(id=postid)
        testhave = UserDislikePost.objects.filter(UserID=myuser,PostID=newpost)
        if len(testhave) == 0:
            newre = UserDislikePost(UserID=myuser,PostID=newpost)
            newre.save()
            newpost.P_DislikeNum += 1
            newpost.save()
            return HttpResponse(newpost.P_DislikeNum)
        else:
            oldre = UserDislikePost.objects.get(UserID=myuser, PostID=newpost)
            oldre.delete()
            newpost.P_DislikeNum -= 1
            newpost.save()
            return HttpResponse(newpost.P_DislikeNum)
    return HttpResponseRedirect("/")


def logout(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    if request.user.is_authenticated():
        auth.logout(request)
        return HttpResponseRedirect('/login/')
    else:
        return HttpResponseRedirect('/login/')


def my_like_courses(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    mylikecoursesre = UserLikeCourse.objects.filter(UserID=myuser)
    mylikecourses = []
    for i in mylikecoursesre:
        mylikecourses.append(i.CourseID)
    mylikecourses = bindHyaku(mylikecourses)
    return render(request, 'web/my_like_courses.html', {'user':myuser,'hotBind':mylikecourses})


# @csrf_exempt
# def ajax_append_image(request):
#     data = request.FILES['file']
#     path = default_storage.save(data.name, ContentFile(data.read()))
#     return HttpResponse(path)
#
# @csrf_exempt
# def ajax_change_image(request):
#     file = request.FILES if request.method == 'POST' else None
#     bbsuser = BBSUser.objects.get(user=request.user)
#     if file:
#         bbsuser.U_Image = file['file']
#         bbsuser.save()
#     return HttpResponse(bbsuser.U_Image)
#
# @csrf_exempt
# def ajax_change_nickname(request):
#     bbsuser = BBSUser.objects.get(user=request.user)
#     bbsuser.U_name = request.POST['newNick']
#     bbsuser.save()
#     return  HttpResponse("修改成功")


@csrf_exempt
def dislike_course(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    print(request.POST)
    dcourse = BBSCourse.objects.get(id=int(request.POST['courseID']))
    newrela = UserDislikeCourse(UserID=myuser,CourseID=dcourse)
    newrela.save()
    return HttpResponseRedirect("/")

def search_post(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    if request.method == 'POST':
        searchContent = request.POST["searchContent"]
        if searchContent == "":
            searchContent = '0'
        return HttpResponseRedirect('/search_course/'+searchContent+'/')

def search_post_my(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    if request.method == 'POST':
        searchContent = request.POST["searchContent"]
        return HttpResponseRedirect('/search_my_course/'+searchContent+'/')

def search_course(request,param):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    coursesall = BBSCourse.objects.all()
    courseBinds = []
    searchContent = param
    # coursesres = BBSCourse.objects.all().filter(Q(C_Name=searchContent)|Q(C_SeqNum=searchContent))
    coursesres = search_course_by_name(coursesall,searchContent)
    courseBinds = bind_course_comment(coursesres)
    return render(request, 'web/search_result.html', {'user': myuser, 'hotBind': courseBinds})

def search_my_course(request,param):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    courseBinds=[]
    searchContent = param
    # coursesres = BBSCourse.objects.all().filter(Q(C_Name=searchContent)|Q(C_SeqNum=searchContent))
    coursesres = search_course_by_name(courses,searchContent)
    courseBinds = bind_course_comment(coursesres)
    return render(request, 'web/search_result.html', {'user': myuser, 'hotBind': courseBinds})

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


@csrf_exempt
def report(request,postid):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    post = BBSPost.objects.get(id=postid)
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')

    if request.method == 'POST':
        reportlist = request.POST.getlist("check")
        for rp in reportlist:
            newReport = UserReportPost(UserID=myuser,PostID=post,Reason=rp)
            newReport.save()
        thiscourseid = post.P_Course.id
        return HttpResponseRedirect('/course_posts/'+str(thiscourseid))
    return render(request, 'web/report.html', {'user': myuser, 'post': post})

def about(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    return render(request,'web/about.html')

def my_gpb(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    myuser = BBSUser.objects.get(user=request.user)
    if myuser.U_NewUser == 0:
        logout(request)
        return HttpResponseRedirect('/login/')
    honors = Honor.objects.all()
    return render(request, 'web/my_gpb.html',{'user':myuser,'honors':honors})

def instruction_my_class(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    myuser = BBSUser.objects.get(user=request.user)
    courses = get_courses(request.user)
    sBlist = []
    for course in courses:
        newsign = 0
        hasEvaBo = hasEva(myuser, course)
        hasComBo = hasCom(myuser, course)
        if hasEvaBo and hasComBo:
            newsign = 3
        elif hasEvaBo and (not hasComBo):
            newsign = 2
        elif (not hasEvaBo) and hasComBo:
            newsign = 1
        else:
            newsign = 0
        sB = signBind(course, newsign, getScore(myuser, course), get_my_comment(myuser, course))
        sBlist.append(sB)
    return render(request, 'web/instruction_my_class.html',{'user': myuser, 'courses': courses, 'coursesBinds': sBlist})

@csrf_exempt
def instruction_course_evaluation(request, courseid):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    course = BBSCourse.objects.get(id=courseid)
    if course not in courses:
        return HttpResponseRedirect('/')
    myuser = BBSUser.objects.get(user=request.user)
    if request.method == "POST":
        print(request.POST)
        oriposts = BBSPost.objects.filter(P_User=myuser,P_Course=course,P_Parent=None)
        if request.POST['com'] == "":
            x=1
        elif len(oriposts) == 0:
            newpost = BBSPost(P_User=myuser,P_Course=course,P_Content=request.POST['com'])
            newpost.save()
            myuser.U_GPB += gpb_amount['post']
            myuser.save()
            course.C_Comnum += 1
            course.save()
        else:
            oriposts.delete()
            newpost = BBSPost(P_User=myuser, P_Course=course, P_Content=request.POST['com'])
            newpost.save()


        re = UserHasCourse.objects.get(UserID=myuser,CourseID=course)
        if re.Score == -1:
            course.C_Ranknum += 1
            re.Score = request.POST['score']
            course.C_Rank = (course.C_Rank * (course.C_Ranknum - 1) + int(request.POST['score'])) / course.C_Ranknum
            course.save()
            myuser.U_GPB += gpb_amount['score']
            print(gpb_amount['score'])
            myuser.save()
        else:
            oriScore = re.Score
            re.Score = request.POST['score']
            course.C_Rank = (course.C_Rank * (course.C_Ranknum) + int(request.POST['score']) - oriScore) / course.C_Ranknum
        re.save()
    re = UserHasCourse.objects.get(UserID=myuser,CourseID=course)
    nB = myRankBind(course,re.Score,get_my_comment(myuser,course))
    return render(request, 'web/instruction_course_evaluation.html', {'user':myuser,'course':course, 'courseBind':nB,'courses':courses})



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




