

M=input('M:');
N=input('N:');
orta=round((N*M)/2);

sayac=0;

img=imread('C:\Users\Omer-Bilgisayar\Desktop\yildiz.jpg');
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

x=1;
bosluk=satir-1;
dizi=zeros(1,M*N);
gecici=zeros(1,M*N);
min=0;  
for k=satir:fark+1
    for l=sutun:fark1+1
       for a=k-bosluk:k+bosluk
            for b=l-bosluk:l+bosluk
               dizi(x)=gray(a,b);
                    
               x=x+1;
%                if x>M*N
%                    x=1;
%                    
%                end
%                
               
               
            end
               
       end
       x=1;
       gecici=sort(dizi);
       Iout(k,l)=gecici(orta);
           
     
              
          
    end
end
display(orta);
figure;imshow(gray);title('Gray');
figure;imshow(Iout);title('Order Filters');