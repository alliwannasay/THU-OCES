from django.contrib import admin
from .models import *

admin.site.register(BBSUser)
admin.site.register(BBSPost)
admin.site.register(BBSCourse)
admin.site.register(UserHasCourse)
admin.site.register(FollowUser)
admin.site.register(UserLikePost)
admin.site.register(UserFollowPost)
admin.site.register(UserHasNode)
admin.site.register(CourseLabel)
admin.site.register(UserFollowLabel)
admin.site.register(UserLikeCourse)
admin.site.register(Honor)
admin.site.register(UserReportPost)
admin.site.register(BBSDept)
# Register your models here.
