img=imread('C:\Users\Omer-Bilgisayar\Desktop\deneme.png');
Igray=rgb2gray(img);

[r,c]=size(Igray);

hr=zeros(1,256);

for i=1:r
    for j=1:c
     index=Igray(i,j)+1;
      hr(index)=hr(index)+1;
    
    end
end

pr=hr/(r*c);
sk(1)=pr(1);

for i=2:numel(pr)
    sk(i)=sk(i-1)+pr(i);
    
end

sk255=sk*255;
Iout=Igray;

for k=1:r
    for l=1:c
        index=Igray(k,l)+1;
        Iout(k,l)=sk255(index);
        
    end
end

figure;imshow(Igray);title('Gray');
figure;imshow(Iout);title('Global Histogram');