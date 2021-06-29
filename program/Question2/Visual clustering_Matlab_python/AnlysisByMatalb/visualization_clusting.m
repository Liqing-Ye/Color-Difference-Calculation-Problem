% 可视化聚类
type centerHSV.txt
type ColorHSV.txt

fileID = fopen('centerHSV.txt','r');
fileID2 = fopen('ColorHSV.txt','r');

formatSpec = '%f,%f,%f';
formatSpec2 = '%f %f %f';
size_imgArray = [3 Inf];
imgArray = fscanf(fileID,formatSpec,size_imgArray);
imgArray2 = fscanf(fileID2,formatSpec2,size_imgArray);
fclose(fileID); 
fclose(fileID2); 

x2=imgArray2(1,:);
y2=imgArray2(2,:);
z2=imgArray2(3,:);

%可视化
for i = 1:10
    %hs(i) = subplot(1,10,i);
    numIn=0.5*i*(i-1)+1;
    x=imgArray(1,numIn:numIn+i-1);
    y=imgArray(2,numIn:numIn+i-1);
    z=imgArray(3,numIn:numIn+i-1);
    figure
    scatter3(x,y,z)
    hold on
    scatter3(x2,y2,z2)
    hold off
    str=int2str(i)
    saveas(gcf,str,'jpg')
end