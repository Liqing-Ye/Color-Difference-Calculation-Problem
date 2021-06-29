% 读取文件
type colorData.txt
type image1.txt %debug: check file

fileID0 = fopen('colorData.txt','r');
tline0 = fgetl(fileID0);
fileID1 = fopen('image1.txt','r');
tline1 = fgetl(fileID1);
fileID2 = fopen('image2.txt','r');
tline2 = fgetl(fileID2);

formatSpec = '%d,(%d,%d,%d)';
size_imgArray = [4 Inf];
imgArray0 = fscanf(fileID0,formatSpec,size_imgArray);
imgArray1 = fscanf(fileID1,formatSpec,size_imgArray);
imgArray2 = fscanf(fileID2,formatSpec,size_imgArray);
fclose(fileID0);
fclose(fileID1); 
fclose(fileID2); 

%进行数据预处理
imgArray0 = imgArray0';
imgArray0(:,1)=[];
imgArray0=imgArray0/255

imgArray1 = imgArray1';
imgArray1(:,1)=[];
imgArray1=imgArray1/255

imgArray2 = imgArray2';
imgArray2(:,1)=[];
imgArray2=imgArray2/255

% RGB转HSV格式
hsv0=rgb2hsv(imgArray0)
hsv1=rgb2hsv(imgArray1)
hsv2=rgb2hsv(imgArray2)

% HSV数据 写入imgHSV.txt
fileID0 = fopen('ColorHSV.txt','w');
hsv0=hsv0';
fprintf(fileID0,'%f %f %f\n',hsv0);
fclose(fileID0);

fileID1 = fopen('imgHSV.txt','w');
hsv1=hsv1';
fprintf(fileID1,'%f %f %f\n',hsv1);
fclose(fileID1);

fileID2 = fopen('imgHSV2.txt','w');
hsv2=hsv2';
fprintf(fileID2,'%f %f %f\n',hsv2);
fclose(fileID2);

type ColorHSV.txt
type imgHSV.txt %debug: check file
type imgHSV2.txt