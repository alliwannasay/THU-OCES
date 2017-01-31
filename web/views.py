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

def bbs_list(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    return render(request, 'index.html',{'courses':courses})


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


        user = validate_user_bymyself(request,studentid=studentidin, password=passwordin)
        if user is not None:
            return HttpResponseRedirect('/')
        else:
            return render(request, "web/login.html", {'error': "学号或密码不正确"})
    else:
        return render(request, "web/login.html")


def course_post_list(request,courseid):
    context = {}
    mycourse = BBSCourse.objects.get(id=courseid)
    hasnotes = 0
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    if mycourse not in courses:
        return HttpResponseRedirect('/')

    myuser = BBSUser.objects.get(user=request.user)
    posts = BBSPost.objects.filter(P_Course=mycourse, P_Parent=None)

    allnotes = BBSPost.objects.filter(P_Course=mycourse, P_Type=type_dic['笔记贴'])
    if len(allnotes) != 0:
        hasnotes = 1
    mynotesrelas = UserHasNode.objects.filter(UserID=myuser)
    mynotes = []
    posts = list(posts)

    for mynotesrela in mynotesrelas:
        mynotes.append(mynotesrela.PostID)
    newposts = []
    for post in posts:
        if post.P_Type == type_dic['笔记贴'] and (post not in mynotes):
            continue
        if post.P_Type == type_dic['大讨论区']:
            continue
        newposts.append(post)

    newposts.reverse()
    context['posts'] = newposts
    context['course'] = mycourse
    context['user'] = myuser

    context['courses'] = courses
    context['hasnotes'] = hasnotes
    return render(request,'web/course_bbs_list.html',context)

def course_post_detail(request,courseid,postid):
    thiscourse = BBSCourse.objects.get(id=courseid)
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    courses = get_courses(request.user)
    if thiscourse not in courses:
        return HttpResponseRedirect('/')

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


def user_self_info(request, param, action):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    visitedUser = User.objects.get(username=param)
    visitedUser = BBSUser.objects.get(user=visitedUser)
    courses = get_courses(request.user)
    #userme = BBSUser.objects.get(user=request.user)
    #courses = get_courses(request.user)
    labels = get_label(request.user)
    labelname = ''
    for label in labels:
        labelname += str(label)
        labelname += ','
    labelname = labelname[:-1]
    
    if request.method == 'POST':
        ischange = request.POST.get('changelabel', None)
        print(ischange == None)
        if not ischange == None:
            return HttpResponseRedirect("/change_label/" + str(param) + "/")
    
    return render(request,'web/user_self_info.html',{'user':visitedUser, 'courses':courses, 'label':labelname })

def user_change_label(request, param):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    visitedUser = User.objects.get(username=param)
    visitedUser = BBSUser.objects.get(user=visitedUser)
    courses = get_courses(request.user)
    
    labels = get_label(request.user)
    labelnames = []
    for label in labels:
        labelnames.append(str(label))
        
    labelnames_un = []
    
    labels = CourseLabel.objects.all()
    for label in labels:
        if not (label.L_Name in labelnames):
            labelnames_un.append(label.L_Name)
    if request.method == 'POST':
        #print("post")
        isdelete = request.POST.get('delete', None)
        isadd = request.POST.get('add', None)
        if not isdelete == None:
            #print("delete")
            #print(request.POST.get('labels_followed', None))
            la = CourseLabel.objects.get(L_Name = request.POST.get('labels_followed', None))
            UserFollowLabel.objects.get(UserID = visitedUser, LabelID = la).delete()
        elif not isadd == None:
            #print("add")
            #print(request.POST.get('labels_unfollowed', None))
            la = CourseLabel.objects.get(L_Name = request.POST.get('labels_unfollowed', None))
            UserFollowLabel.objects.create(UserID = visitedUser, LabelID = la)
        
        return HttpResponseRedirect("/change_label/" + str(param) + "/")
    
    return render(request,'web/user_change_label.html',
                  {'user':visitedUser, 'courses':courses, 'labels_followed': labelnames, 'labels_unfollowed': labelnames_un})

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
