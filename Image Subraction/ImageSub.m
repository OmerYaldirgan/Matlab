clear
clc
close all
% Girdiginiz resimlerin boyutlarý ayný olmasýna dikkat edinn
img1=rgb2gray(imread('C:\Users\Omer-Bilgisayar\Desktop\a1.jpg'));
img2=rgb2gray(imread('C:\Users\Omer-Bilgisayar\Desktop\deneme.jpg'));


Iout=double(img1)-double(img2);


min=min(min(Iout));
if min<0
    Iout=Iout +abs(min);
end

max=max(max(Iout));
if max>255
   Iout=Iout*(255/max); 
end
figure, imshow(img1);
figure, imshow(img2);
figure, imshow(uint8(Iout));title('Cýkarýlmýs Hal');