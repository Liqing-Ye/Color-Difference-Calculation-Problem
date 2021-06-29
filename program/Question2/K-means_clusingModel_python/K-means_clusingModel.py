#!/usr/bin/env python
# coding: utf-8

# In[ ]:


# 问题二___找过渡色
from sklearn.cluster import KMeans
import numpy as np

# 读取hsv格式的数据文件
dataColor = np.loadtxt("D:\\Matlab 2019 b\\matlab code\\20210501\\colorHSV.txt") 

### < summary >
### K_means Classification, _clustering algorithm , Unsupervised Learning
### < /summary >
### < param name = dataColor ,n_center > < /param >
### < return > < /return >
def K_means(dataColor,n_center):
    kmeans = KMeans(n_clusters=n_center, random_state=0).fit(dataColor)
    center=kmeans.cluster_centers_
    #print("中心点坐标:\n ",center)
    return center


# 输出结果
fResult1=open("D:\\Matlab 2019 b\\matlab code\\20210501\\centerHSV.txt",'w')
n=1
while n<11:
    center=K_means(dataColor,n)
    for i in center:
        fResult1.write(str(i[0])+","+str(i[1])+","+str(i[2])+"\n")  #\r\n为换行符
    #center.append(K_means(dataColor,n))
    n=n+1
fResult1.close()    

