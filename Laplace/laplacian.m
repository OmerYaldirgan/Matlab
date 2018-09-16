clear 
clc
close all
Iout = imread('C:\Users\Omer-Bilgisayar\Desktop\moon.tif');
lap = Iout;
[n,m] = size(Iout);
maske = [-1,-1,-1;-1,9,-1;-1,-1,-1];
% maske=[0,1,0;1,-4,1;0,1,0];         
         

lap = double(lap);
for i=2:n-1
    for j=2:m-1
        lapDeger = 0;
        for x=1:3
            for y=1:3
                lapDeger = double(lapDeger) + (double(Iout(i + x - 2, j + y - 2)) * double(maske(x,y))); 
            end
        end
        lap(i,j) = lapDeger;
    end
end

laplaceFiltreli = uint8(lap);
figure; imshow(laplaceFiltreli); title('Laplace Filtreli')

min = min(min(lap));
if min<0 
    lap = lap - min;
end
max = max(max(lap));
if max>0
    lap = lap * 255 / max;
end

lap = uint8(lap);

figure; imshow(Iout); title('Orjinal Resim')
figure; imshow(lap); title('Ölçeklenmiþ Resim')

lap = double(laplaceFiltreli) + double(Iout);


lap = uint8(lap);
figure; imshow(lap); title('Final Resim')
