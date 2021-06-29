#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import math
import numpy as np

def HSVDistance(hsv_1,hsv_2):
    """
    色差算法
    """
    H_1,S_1,V_1 = hsv_1
    H_2,S_2,V_2 = hsv_2
    R=100
    angle=30
    h = R * math.cos(angle / 180 * math.pi)
    r = R * math.sin(angle / 180 * math.pi)
    x1 = r * V_1 * S_1 * math.cos(H_1 / 180 * math.pi);
    y1 = r * V_1 * S_1 * math.sin(H_1 / 180 * math.pi);
    z1 = h * (1 - V_1);
    x2 = r * V_2 * S_2 * math.cos(H_2 / 180 * math.pi);
    y2 = r * V_2 * S_2 * math.sin(H_2 / 180 * math.pi);
    z2 = h * (1 - V_2);
    dx = x1 - x2;
    dy = y1 - y2;
    dz = z1 - z2;
    return math.sqrt(dx * dx + dy * dy + dz * dz);

def putIn(result,maxRows,color_maxRows,data,dataColor):
    """
    执行函数
    """
    rowIndex=0
    colorRowIndex=0
    hsvDistance=[]
    tmp_hsvDistance=[]
    while(rowIndex<maxRows-1):
        # 实现22个颜色分别计算色差
        colorRowIndex=rowIndex+1
        while(colorRowIndex<color_maxRows): #  color_maxRows=22
            tmp_hsvDistance.append(HSVDistance(data[rowIndex,:],dataColor[colorRowIndex,:]))
            colorRowIndex=colorRowIndex+1
        #找出最小的distance 返回对应index
        colorRowIndex=0
        if(len(tmp_hsvDistance)!=0):
            minIndex=tmp_hsvDistance.index(min(tmp_hsvDistance)) #索引从0开始
            hsvDistance.append([minIndex,tmp_hsvDistance[minIndex]]) # 保存最小hsvDistance和对应的颜色索引 
            result.append([rowIndex+1,minIndex+1,tmp_hsvDistance[minIndex]]) #在结果输出时将索引增一，适应人类读取习惯
        tmp_hsvDistance=[]
        rowIndex=rowIndex+1

# 读取hsv格式的数据文件
dataColor = np.loadtxt("D:\\Matlab 2019 b\\matlab code\\20210501\\10centerHSV.txt") 
dataColor_copy=dataColor.copy()

[color_maxRows,color_maxCols]=np.shape(dataColor); 

# 运用色差算法计算相似度
result=[]
putIn(result,color_maxRows,color_maxRows,dataColor_copy,dataColor)

# 输出结果
fResult1=open("D:\\Matlab 2019 b\\matlab code\\20210501\\result.txt",'w')

for i in result:
    fResult1.write(str(i[0])+","+str(i[1])+","+str(i[2])+"\n")  #\r\n为换行符

fResult1.close()

