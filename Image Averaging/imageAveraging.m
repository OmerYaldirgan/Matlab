close all;
clear

% g�r�nt� say�s� art�kca orjinal resme yaklas�r
adet=input('adet:');
Iout=rgb2gray(imread('C:\Users\Omer-Bilgisayar\Desktop\deneme.jpg'));

figure;imshow(Iout);title('Original');
[m ,n]=size(Iout);


IoutToplam=zeros(m,n);
IoutOrt=zeros(m,n);

 for i=1:adet
    d=imnoise(Iout,'salt & pepper',0.05);
    IoutToplam=IoutToplam+double(d);
 end
 IoutOrt=uint8(IoutToplam/adet);
 figure;imshow( IoutOrt);title('i�lenmi� hali');

    