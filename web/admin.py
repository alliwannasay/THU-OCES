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
# Register your models here.
