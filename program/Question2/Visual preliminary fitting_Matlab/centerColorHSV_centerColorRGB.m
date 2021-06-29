% 新增颜色HSV格式转RGB
type centerHSV.txt %debug: check file
fileID = fopen('centerHSV.txt','r');

formatSpec = '%f,%f,%f';
size_imgArray = [3 Inf];
imgArray = fscanf(fileID,formatSpec,size_imgArray);
fclose(fileID); 

imgArray=imgArray';
rgb = hsv2rgb(imgArray);
rgb=rgb*255

% RGB数据 写入center_ColorRGB.txt
fileID0 = fopen('center_ColorRGB.txt','w');
for i = 1:10
    numIn=0.5*i*(i-1)+1
    anss=round(rgb(numIn:numIn+i-1,:)) 
    fprintf(fileID0,'如果新增%d个颜色的瓷砖，它们的颜色分别为：\n',i);
    anss=anss'
    fprintf(fileID0,'(%d,%d,%d)\n',anss);
end
fclose(fileID0);

type center_ColorRGB.txt