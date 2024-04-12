%Circuito de Chua%
%Baseado no artigo de Kennedy e no livro de Aguirre

function out = chuapseudo(t,in)
x=in(1); 
y=in(2);
z=in(3);

%Dados Componentes do Circuito de Chua%

C1=10*10^(-9);
C2=100*10^(-9);
L=19*10^(-3);
R=1800;
m0 = -0.37*10^(-3);
m1 = -0.68*10^(-3);
Bp = 1.1;

%Equação Diodo de Chua 2%
if  x >Bp 
    id=m0*x+Bp*(m1-m0);
elseif  x<-Bp
    id=m0*x+Bp*(m0-m1);        
else 
    id=m1*x;    
end

% Equações de Chua%
xdot = (1/C1)*((y-x)/R-id);
ydot = (1/C2)*((x-y)/R+z);
zdot  = -(1/L)*y;

out = [xdot ydot zdot]';

