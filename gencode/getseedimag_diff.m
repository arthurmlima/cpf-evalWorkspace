function [seed] = getseedimag_diff(I,DIFF)

[width, height] = size(I);
Ic=I; 
if DIFF==1
xcord=abs(randi(width));
ycord=abs(randi(height));
value=abs(randi(256)-1);
Ic(xcord,ycord)=value;

x=mean2(Ic)*10^(-4);
y=abs(x-mean2(I)*10^(-4));
z=y*10^(5);
Y=y*10E+19;

length(dec2hex(fix(Y)));
Hex=dec2hex(fix(Y),10);

St1=hex2dec(strcat(Hex(1),Hex(3),Hex(5), Hex(7),Hex(9)));
St2=hex2dec(strcat(Hex(2),Hex(4),Hex(6), Hex(8),Hex(10)));
seed=((10E-8)*bitxor(St1,St2)+0.01+mean2(Ic)*10^(-5));
else
seed=13*mean2(Ic)*10^(-4);
end
end

