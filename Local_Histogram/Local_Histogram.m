%M ve N degerlerini d�sardan ald�k.
M=input('M degerini giriniz:');
N=input('N degerini giriniz:');

%resmi ald�k.
img=imread('C:\Users\Omer-Bilgisayar\Desktop\deneme1.jpg');
%resmi g�sterdik 
figure,imshow(img); title('3 boyutlu');

%resmi griye cevirdik
gray=rgb2gray(img);
%gri resmi g�sterdik
figure,imshow(gray);title('2 boyutlu');



%3.3 luk orta noktas�
orta=round((N*M)/2);

%�mage boyutu bunun �st�nde gezecez.
[r,c] = size(gray);


hr=zeros(1,256);
sayac=0;
Iout=gray;
%orta eleman�n�n kac�nc� satir ve sutunda oldugu �grenidi.
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
%tam olmas� i�in
fark=r-satir;
fark1=c-sutun;

bosluk=satir-1;
%fark ve fark1 +1 ekledikki boyutu tam otutturmak i�in
%%cevresinde orta noktlar� d�nd�k. ve kac adet nokta var belirledik.
for k=satir:fark+1
    for l=sutun:fark1+1
        %gecilecek nokta say�s�
        sonuc=k*l;
        %�nceki degerin yine i�ini bosalt�k
        hr=zeros(1,256);
        %dinamik olmas� i�in butun karelerde dolasmas� i�in bosluk
        %ayarlamalar� yap�ld�
        for a=k-bosluk:k+bosluk
            for b=l-bosluk:l+bosluk
                %histogram hesapland�
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

%ekrana basd�k
display(orta);
display(satir);
display(sutun);
fprintf('Bosluk Sayisi:%d\n',bosluk);
fprintf('sutun boyut:%d\n',fark1);
fprintf('satir boyut:%d\n',fark);
fprintf('nokta sayisi:%d\n',sonuc);
figure;imshow(gray);title('Gray');
figure;imshow(Iout);title('Iout');