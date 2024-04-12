%ODE Circuito de Chua%
a=imread('lena-256x256.jpg');   %lena-256x256.jpg, boat.jpg, house.png, pepper.png, cameraman.jpg, black512.jpg, white512.jpg
bmean1=mean2(a)*10^-2+0.5;
a(125,27)
a(125,27)=a(125,27)+1;
a(125,27)
bmean2=mean2(a)*10^-2+0.5;
bmean2-bmean1

h=1e-6;
y0=[b -0.2 0];
%tf=0.09;
tf=0.35; % Para imagens totalmente pretas e brancas
tspan = 0:h:tf;
x = ode4(@chuapseudo,tspan,y0);

