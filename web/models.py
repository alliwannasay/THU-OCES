from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from django.template.defaultfilters import default
# from _overlapped import NULL


class BBSUser(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    U_studentid = models.CharField(max_length=15)
    # U_password = models.CharField(max_length=100)
    U_name = models.CharField(blank=True,max_length=50)
    U_RealName = models.CharField(blank=True,max_length=50)
    U_Honor = models.CharField(blank=True, max_length=50)
    U_Major = models.TextField(blank=True)
    U_Description = models.TextField(null=True, blank=True)
    U_Image = models.ImageField(null=True, blank=True)
    U_Identity = models.IntegerField(default=1)
    U_Level = models.IntegerField(default=0)
    U_GPB = models.IntegerField(default=0)
    U_FollowUserNum = models.IntegerField(default=0)
    U_FollowPostNum = models.IntegerField(default=0)
    U_PostNum = models.IntegerField(default=0)
    U_QuestionNum = models.IntegerField(default=0)
    U_AnswerNum = models.IntegerField(default=0)
    U_NewUser = models.IntegerField(default = 0)

    def __str__(self):
        return self.U_studentid

class BBSDept(models.Model):
    D_Code = models.IntegerField(default=0) # 开课院系代号
    D_Name = models.CharField(max_length=100, blank=True) #开课院系简称

    def __str__(self):
        return self.D_Name


class BBSCourse(models.Model):
    C_Name = models.CharField(max_length=100) #课程名
    C_CorNum = models.CharField(max_length=50,null=True) #课程号
    C_SeqNum = models.IntegerField(default=0) #课序号
    C_Grade = models.IntegerField(default=0) #学分
    C_Dept = models.IntegerField(null=True) #departmentid
    C_Teacher = models.CharField(max_length=50,null=True) #主讲教师
    C_UnderG = models.IntegerField(default=0) #本科生课容量
    C_PostG = models.IntegerField(default=0) #研究生课容量
    C_Intro = models.CharField(max_length=100, blank=True) #选课文字说明
    C_Feature = models.CharField(max_length=100, blank=True)  #课程特色
    C_Level = models.CharField(max_length=50, blank=True) #年级
    C_Snd = models.CharField(max_length=10, blank=True) #是否二级选课
    C_Exam = models.CharField(max_length=500, blank=True)  #考核方式
    C_Textbook = models.CharField(max_length=1000, blank=True)  #教材及参考书
    C_Guide = models.CharField(max_length=200, blank=True)#选课指导
    C_Pre = models.CharField(max_length=200, blank=True)  #先修要求
    C_Ranknum = models.IntegerField(default=0)
    C_Rank = models.DecimalField(default=0,max_digits=2,decimal_places=1)
    C_Comnum = models.IntegerField(default=0)

    def __str__(self):
        return self.C_Name

class BBSPost(models.Model):
    P_User = models.ForeignKey(BBSUser, on_delete=models.CASCADE)  # 帖子作者关系
    P_Course = models.ForeignKey(BBSCourse, on_delete=models.CASCADE)
    P_Type = models.IntegerField(default=0)
    P_Title = models.CharField(max_length=100, blank=True)
    P_Content = models.TextField()
    P_Time = models.DateTimeField(default=timezone.now)
    P_LastComTime = models.DateTimeField(default=timezone.now)
    P_LikeNum = models.IntegerField(default=0)
    P_DislikeNum = models.IntegerField(default=0)
    P_Section = models.IntegerField(default=1)
    P_Parent = models.ForeignKey('self', blank=True, null=True,related_name="child", on_delete=models.CASCADE)
    P_ReplyNum = models.IntegerField(default=0)
    P_Top = models.IntegerField(default=0)
    P_Wanted = models.IntegerField(default=0)
    P_BestChild = models.ForeignKey('self',blank=True,default=None,null=True,related_name="parent", on_delete=models.CASCADE)
    P_Level = models.IntegerField(default=0)

    def __str__(self):
        return self.P_Content





class FollowUser(models.Model):
    User1ID = models.ForeignKey(BBSUser, related_name='follower', on_delete=models.CASCADE)
    User2ID = models.ForeignKey(User, related_name='followee', on_delete=models.CASCADE)

class UserLikePost(models.Model):
    UserID = models.ForeignKey(BBSUser, on_delete=models.CASCADE)
    PostID = models.ForeignKey(BBSPost, on_delete=models.CASCADE)

class UserFollowPost(models.Model):
    UserID = models.ForeignKey(BBSUser, on_delete=models.CASCADE)
    PostID = models.ForeignKey(BBSPost, on_delete=models.CASCADE)

class UserHasCourse(models.Model):
    UserID = models.ForeignKey(BBSUser, on_delete=models.CASCADE)
    CourseID = models.ForeignKey(BBSCourse, on_delete=models.CASCADE)
    Score = models.IntegerField(default = -1)
    Term = models.CharField(max_length=15)

class UserHasNode(models.Model):
    UserID = models.ForeignKey(BBSUser, on_delete=models.CASCADE)
    PostID = models.ForeignKey(BBSPost, on_delete=models.CASCADE)
    
    
class CourseLabel(models.Model):
    L_Name = models.CharField(max_length=100)

    def __str__(self):
        return self.L_Name
    
class UserFollowLabel(models.Model):
    UserID = models.ForeignKey(BBSUser, on_delete=models.CASCADE)
    LabelID = models.ForeignKey(CourseLabel, on_delete=models.CASCADE)

class UserDislikeCourse(models.Model):
    UserID = models.ForeignKey(BBSUser, on_delete=models.CASCADE)
    CourseID = models.ForeignKey(BBSCourse, on_delete=models.CASCADE)

class UserDislikePost(models.Model):
    UserID = models.ForeignKey(BBSUser, on_delete=models.CASCADE)
    PostID = models.ForeignKey(BBSPost, on_delete=models.CASCADE)

class UserLikeCourse(models.Model):
    UserID = models.ForeignKey(BBSUser, on_delete=models.CASCADE)
    CourseID = models.ForeignKey(BBSCourse, on_delete=models.CASCADE)

class UserReportPost(models.Model):
    UserID = models.ForeignKey(BBSUser, on_delete=models.CASCADE)
    PostID = models.ForeignKey(BBSPost, on_delete=models.CASCADE)
    Reason = models.CharField(max_length=50)

class Honor(models.Model):
    H_Name = models.CharField(blank=True, max_length=50)
    H_Threshold = models.IntegerField(default = 0)


