# -*- coding: cp936 -*-
import win32com.client as win32
import os
excel=win32.gencache.EnsureDispatch('Excel.Application')
excel.Visible=False
workbook=excel.Workbooks.Open(os.path.join(os.getcwd(),'TRY.xlsx'))
sheet1=workbook.Worksheets(1)
sheet1.Cells(1,299).Value='HelloWin32com'
sheet1.Cells(1,300).Value='HelloWin32file'
workbook.Save()
excel.Application.Quit()
