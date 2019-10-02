# -*- coding: cp936 -*-
#使用row.getValue(xxx),row.setValue(xxx)去替代row.xxx，可以避免自己去写filed的真正名字，filed可以来自arcpy.ListFields()函数返回值
#目前欠解决问题是SearchCursor或UpdateCursor函数中where条件还是要使用真正字段名
import arcpy
from arcpy import env
env.workspace="D:\MODISAODC6\Comparison\Prediction"
fields=arcpy.ListFields("Site.shp")
for field in fields:
    print field.name
cur=arcpy.SearchCursor("Site.shp")
for row in cur:
    for field in fields:
        print field.name,row.getValue(field.name)
del cur,row
