
v=[11,11,11;11,1,11;11,11,11];

M=size(v,1);
N=size(v,2);



toplam=0;
toplam=sum(sum(v));
 
orta=round((N*M)/2);
carpim=0;
sayac=0;
toplam1=0;
img=imread('C:\Users\Omer-Bilgisayar\Desktop\a1.jpg');
gray=rgb2gray(img);


[r,c] = size(gray);
for i=1:M
   for j=1:N
       sayac=sayac+1;
       if(orta==sayac)
           satir=i;
           sutun=j;
           break;
       end
       
   end
   
end
Iout=gray;
fark=r-satir;
fark1=c-sutun;


bosluk=satir-1;

for k=satir:fark+1
    for l=sutun:fark1+1
        carpim=0;
        
        x=1;
        y=1;
        toplam1=0;
       for a=k-bosluk:k+bosluk
            for b=l-bosluk:l+bosluk
               
                d=uint16(gray(a,b));
               
                carpim=d*v(x,y);
               toplam1=carpim+toplam1;
               y=y+1;
            end
            y=1;
            x=x+1;
            if x>3
                x=1;
            end
        end
           Iout(k,l)=toplam1/toplam;
      
              
          
    end
end
figure;imshow(gray);title('Gray');
figure;imshow(Iout);title('Maskeli sonuc1');


