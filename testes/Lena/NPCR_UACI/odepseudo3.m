%ODE Circuito de Chua%
format long
a=imread('black512.jpg');   %lena-256x256.jpg, boat.jpg, house.png, pepper.png, cameraman.jpg, black512.jpg, white512.jpg
a2=a;
a2(150,100)=mod(a2(150,100)+1,256);
b=mean2(a2)*10^-5+0.5;
h=1e-6;
y0=[b -0.2 0];
%tf=0.09;
tf=0.35; % Para imagens totalmente pretas e brancas
tspan = 0:h:tf;
x3 = ode4(@chuapseudo3,tspan,y0);
