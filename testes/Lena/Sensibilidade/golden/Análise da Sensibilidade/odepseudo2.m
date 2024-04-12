%ODE Circuito de Chua%
format long
a=imread('lena-256x256.jpg');   %lena-256x256.jpg, boat.jpg, house.png, pepper.png, cameraman.jpg, white512.jpg, black512.jpg
b=mean2(a)*10^-5+0.5;
h=1e-6;
y0=[b -0.2 0];
tf=0.09;
%tf=0.35;                           % Para as imagens Branca e Preta
tspan = 0:h:tf;
x2 = ode4(@chuapseudo2,tspan,y0);