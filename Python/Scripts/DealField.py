# -*- coding: cp936 -*-
#ʹ��row.getValue(xxx),row.setValue(xxx)ȥ���row.xxx�����Ա����Լ�ȥдfiled���������֣�filed��������arcpy.ListFields()��������ֵ
#ĿǰǷ���������SearchCursor��UpdateCursor������where��������Ҫʹ�������ֶ���
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
