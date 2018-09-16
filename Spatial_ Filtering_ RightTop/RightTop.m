
v=[11,11,11;11,11,11;11,11,11];

M=size(v,1);
N=size(v,2);
toplam=0;
for i=1:M
    for j=1:N
        toplam=toplam+v(i,j);
    end
end

orta=round((N*M)/2);

satir=round(M/2);
sutun=round(N/2);

 

carpim=0;

toplam1=0;
img=imread('C:\Users\Omer-Bilgisayar\Desktop\a1.jpg');
gray=rgb2gray(img);


[r,c] = size(gray);

Iout=gray;
fark=(r-satir)+1;
fark1=(c-sutun)+1;


bosluk=satir-1;
x=1;
y=1;
for k=satir:fark
    for l=fark1:-1:sutun
        carpim=0;
         toplam1=0;
       for a=k-bosluk:k+bosluk
            for b=l-bosluk:l+bosluk
               
                d=double(gray(a,b));
              
               carpim=d*v(x,y);
               toplam1=carpim+toplam1;
               y=y+1;
               
            end
            y=1;
             x=x+1;
           
            
       end
        x=1;
        Iout(k,l)=toplam1/toplam;
      
              
          
    end
end
figure;imshow(gray);title('Gray');
figure;imshow(Iout);title('Maskeli sonuc1');


