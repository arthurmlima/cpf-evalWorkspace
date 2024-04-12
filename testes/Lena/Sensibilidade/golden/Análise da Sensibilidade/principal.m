%Arquivo principal%
%Pseudo-órbitas%

%Simulação Tradicional
odepseudo

%Simulação Tradicional 
odepseudo2

%Simulação Tradicional
odepseudo3

%Simulação Tradicional 
odepseudo4

%Cálculo e plotagem do Lower Bound Error 1
Xeq1=(x(:,1)-x2(:,1))/2;
er=(x(:,1)-x2(:,1))./(x(:,1)+x2(:,1));
figure(1)
plot(log10(abs(Xeq1)))
xlabel('Iterações','FontSize',15)
ylabel('log_{10}(\delta_{\alpha,n})','FontSize',15)
aux=[find(log10(er)>-10)];
aux1=aux(1,1);

%Cálculo e plotagem do Lower Bound Error 2
Xeq2=(x3(:,1)-x4(:,1))/2;
er=(x3(:,1)-x4(:,1))./(x3(:,1)+x4(:,1));
figure(2)
plot(log10(abs(Xeq2)))
xlabel('Iterações','FontSize',15)
ylabel('log_{10}(\delta_{\alpha,n})','FontSize',15)
aux=[find(log10(er)>-10)];
aux2=aux(1,1);

%Leitura da imagem
a=imread('lena-256x256.jpg');   %lena-256x256.jpg, boat.jpg, house.png, pepper.png, cameraman.jpg, white512.jpg, black512.jpg
%Mostrar a Figura lida
figure(3)
imshow(a)
a=a(:,:,1);  %Mudar a a imagem para uma matriz de ordem 2
t=size(a);
ta1=t(:,1);
ta2=t(:,2);

%Plotagem do Histograma
figure(4)
imhist(a)


%Estudo da caoticidade na criptografia de imagens
b=log10(abs(Xeq1));

%Transformar os valores de d em números inteiros positivos [0;255]
c=b*10^(15);
d=mod(c,256);
e=uint8(d);
f=e(aux1: aux1+65535); 
%f=e(aux1: aux1+262143);        % Para as imagens Branca e Preta
g=f';
h=vec2mat(g,256);
%h=vec2mat(g,512);
i=bitxor(a,h,'uint8');

%Mostrar a imagem criptografada 
figure(5)
imshow(i)

%Plotagem do Histograma
figure(6)
imhist(i)

%Estudo da caoticidade na criptografia de imagens
b2=log10(abs(Xeq2));

%Transformar os valores de d em números inteiros positivos [0;255]
c2=b2*10^(15);
d2=mod(c2,256);
e2=uint8(d2);
f2=e2(aux2: aux2+65535);
%f2=e2(aux2: aux2+262143);        % Para as imagens Branca e Preta
g2=f2';
h2=vec2mat(g2,256);
%h2=vec2mat(g2,512);
i2=bitxor(a,h2,'uint8');

%Mostrar a imagem criptografada 
figure(7)
imshow(i2)

%Plotagem do Histograma
figure(8)
imhist(i2)

j=bitxor(i,h2,'uint8');
figure(9)
imshow(j)
print('lena_dec3','-depsc')



results = sensitivity( i, i2, 1, 255 )
results2 = sensitivity( a, j, 1, 255 )


