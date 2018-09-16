%M ve N degerlerini dýsardan aldýk.
M=input('M degerini giriniz:');
N=input('N degerini giriniz:');

%resmi aldýk.
img=imread('C:\Users\Omer-Bilgisayar\Desktop\deneme1.jpg');
%resmi gösterdik 
figure,imshow(img); title('3 boyutlu');

%resmi griye cevirdik
gray=rgb2gray(img);
%gri resmi gösterdik
figure,imshow(gray);title('2 boyutlu');



%3.3 luk orta noktasý
orta=round((N*M)/2);

%Ýmage boyutu bunun üstünde gezecez.
[r,c] = size(gray);


hr=zeros(1,256);
sayac=0;
Iout=gray;
%orta elemanýnýn kacýncý satir ve sutunda oldugu ögrenidi.
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
%tam olmasý için
fark=r-satir;
fark1=c-sutun;

bosluk=satir-1;
%fark ve fark1 +1 ekledikki boyutu tam otutturmak için
%%cevresinde orta noktlarý döndük. ve kac adet nokta var belirledik.
for k=satir:fark+1
    for l=sutun:fark1+1
        %gecilecek nokta sayýsý
        sonuc=k*l;
        %önceki degerin yine içini bosaltýk
        hr=zeros(1,256);
        %dinamik olmasý için butun karelerde dolasmasý için bosluk
        %ayarlamalarý yapýldý
        for a=k-bosluk:k+bosluk
            for b=l-bosluk:l+bosluk
                %histogram hesaplandý
                index=gray(a,b)+1;
                hr(index)=hr(index)+1;
            end
        end
        pr=hr/(M*N);
        sk(1)=pr(1);
        for e=2:numel(pr)
            sk(e)=sk(e-1)+pr(e);
        end
        
        sk255=sk*255;
        index=gray(k,l)+1;
        Iout(k,l)=sk255(index);
    end
end

%ekrana basdýk
display(orta);
display(satir);
display(sutun);
fprintf('Bosluk Sayisi:%d\n',bosluk);
fprintf('sutun boyut:%d\n',fark1);
fprintf('satir boyut:%d\n',fark);
fprintf('nokta sayisi:%d\n',sonuc);
figure;imshow(gray);title('Gray');
figure;imshow(Iout);title('Iout');