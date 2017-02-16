# -*- coding:utf-8 -*-
import importlib
import sys
importlib.reload(sys)
f = open("info.txt",'r',encoding='gbk')
lines = f.readlines()
print(lines[len(lines)-1])
f.close()