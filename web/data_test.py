from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from django.template.defaultfilters import default

from .models import *




BBSCourse.objects.create(C_Name = '测试课程', C_SeqNum = '77777777', C_Term = '2001-2002-1')
'''
    C_Name = models.CharField(max_length=100)
    C_SeqNum = models.CharField(blank=True,max_length=50)
    C_Ranknum = models.IntegerField(default=0)
    C_Rank = models.FloatField(default=0)
    C_Term = models.CharField(max_length=15)
'''
