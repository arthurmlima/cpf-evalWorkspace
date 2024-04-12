%Arquivo principal%
%Pseudo-órbitas%

%Simulação Tradicional
odepseudo

%Simulação Tradicional 
odepseudo2

%Cálculo e plotagem do Lower Bound Error
Xeq=(x(:,1)-x2(:,1))/2;
er=(x(:,1)-x2(:,1))./(x(:,1)+x2(:,1));
figure(5)
plot(log10(abs(Xeq)))
xlabel('Iterações','FontSize',15)
ylabel('log_{10}(\delta_{\alpha,n})','FontSize',15)
aux=[find(log10(er)>-10)];
aux1=aux(1,1);

%Leitura da imagem
a=imread('lena-256x256.jpg');    %lena-256x256.jpg, boat.jpg, house.png, pepper.png, cameraman.jpg, black512.jpg, white512.jpg
a2=a;
%a2(150,100)=mod(a2(150,100)+1,256);
%Mostrar a Figura lida
figure(6)
imshow(a)
a=a(:,:,1);  %Mudar a a imagem para uma matriz de ordem 2
t=size(a);
ta1=t(:,1);
ta2=t(:,2);

%Mostrar a Figura lida
figure(7)
imshow(a2)
a2=a2(:,:,1);  %Mudar a a imagem para uma matriz de ordem 2
t=size(a2);
ta12=t(:,1);
ta22=t(:,2);

%Estudo da caoticidade na criptografia de imagens
b=log10(abs(Xeq));

%Transformar os valores de d em números inteiros positivos [0;255]
c=b*10^(15);
d=mod(c,256);
e=uint8(d);
f=e(aux1: aux1+65535); 
%f=e(aux1: aux1+262143); % Para imagens totalmente pretas e brancas
g=f';
%h=vec2mat(g,256);
h=vec2mat(g,256); % Para imagens totalmente pretas e brancas
i=bitxor(a,h,'uint8');

%Mostrar a imagem criptografada 
figure(8)
imshow(i)

%Plotagem do Histograma
figure(9)
imhist(i)

%Simulação Tradicional
odepseudo3

%Simulação Tradicional 
odepseudo4
%Cálculo e plotagem do Lower Bound Error 2
Xeq2=(x3(:,1)-x4(:,1))/2;
er2=(x3(:,1)-x4(:,1))./(x3(:,1)+x4(:,1));
figure
plot(log10(abs(Xeq2)))
xlabel('Iterações','FontSize',15)
ylabel('log_{10}(\delta_{\alpha,n})','FontSize',15)
aux=[find(log10(er2)>-10)];
aux2=aux(1,1);

%Estudo da caoticidade na criptografia de imagens
b2=log10(abs(Xeq2));

%Transformar os valores de d em números inteiros positivos [0;255]
c2=b2*10^(15);
d2=mod(c2,256);
e2=uint8(d2);
f2=e2(aux2: aux2+65535); 
%f2=e2(aux2: aux2+262143); % Para imagens totalmente pretas e brancas
g2=f2';
%h2=vec2mat(g2,256);
h2=vec2mat(g2,256); % Para imagens totalmente pretas e brancas
a2=a2(:,:,1);
j=bitxor(a2,h2,'uint8');

%Mostrar a imagem criptografada 
figure(10)
imshow(j)

%Plotagem do Histograma
figure(11)
imhist(j)

results = NPCR_and_UACI( i, j, 1, 255 );

