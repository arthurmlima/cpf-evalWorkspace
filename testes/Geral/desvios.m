function [MaxDev,IrreDev,DUH] = desvios(o,c)
%DEVIATIONSENCRYPTION Summary of this function goes here
%   Detailed explanation goes here
[he wi]=size(o);
[Onpix Opixels]=imhist(o);
[Cnpix Cpixels]=imhist(c);

h=abs(Onpix-Cnpix);

 MaxDev = (h(1)+h(256))/2 + sum(h(2:255));

DC=mean(h);

AC= abs(h-DC);

IrreDev=sum(AC);

DUH=sum(abs(Cnpix-he*wi/256))/(he*wi);

