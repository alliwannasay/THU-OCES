from django.conf.urls import url
from . import views
from .views import *
urlpatterns = [
    url(r'^$', views.bbs_list, name='index'),
    url(r'^course/(\d+)/$', views.course_post_list,name='course'),
    url(r'^course_posts/(\d+)/',views.course_posts),
    url(r'^login/$',views.login,name='login'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^course/(\d+)/post/(\d+)/$',views.course_post_detail),
    url(r'^me/(\w+)/(\w*)$',views.user_self_info,name='me'),
    url(r'^like_post_deal/$', views.like_post_deal),
    url(r'^like_course/$',views.like_course),
    url(r'^course/(\d+)/delete_post/(\d+)/parentpost/(\d+)/$', views.delete_post),
    url(r'^course/(\d+)/delete_post/(\d+)/$', views.delete_bigpost),
    url(r'^post/(\d+)/$',views.post_course_post,name='newpost'),
    url(r'^good/(\d+)/(\d+)/$',views.good_post),
    url(r'^ajax_change_nickname/$', views.ajax_change_nickname),
    url(r'^ajax_append_image/$', views.ajax_append_image),
    url(r'^ajax_change_image/$', views.ajax_change_image),
    url(r'^change_label/(\w+)/$', views.user_change_label),
    url(r'^my_class/(\w+)/$', views.my_class),
    url(r'^course_evaluation/(\w+)/(\d+)/', views.course_evaluation),
    url(r'^dislike_course/$', views.dislike_course),
    url(r'^instruction/$',views.instruction),
    url(r'^search_course/$',views.search_course),
    url(r'^my_like_courses/$',views.my_like_courses),
    url(r'^report/(\d+)/$',views.report),
    url(r'^about/',views.about)
    
]
