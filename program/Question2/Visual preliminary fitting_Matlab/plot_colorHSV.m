% 可视化新增颜色的HSV格式数据空间位置，初步拟合
fileID = fopen('centerHSV.txt','r');

formatSpec = '%f,%f,%f';
size_imgArray = [3 Inf];
imgArray = fscanf(fileID,formatSpec,size_imgArray);
fclose(fileID); 

%可视化
for i = 1:10
    %hs(i) = subplot(1,10,i);
    numIn=0.5*i*(i-1)+1
    x=imgArray(1,numIn:numIn+i-1)
    y=imgArray(2,numIn:numIn+i-1)
    z=imgArray(3,numIn:numIn+i-1)
    %scatter3(hs(i),x,y,z)
    figure
    scatter3(x,y,z)
    str=int2str(i)
    saveas(gcf,str,'jpg')
end