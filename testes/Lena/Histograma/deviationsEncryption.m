function [MaxDev,IrreDev,DUH] = deviationsEncryption(o,c)
%DEVIATIONSENCRYPTION Summary of this function goes here
%   Detailed explanation goes here

[Onpix Opixels]=imhist(o);
[Cnpix Cpixels]=imhist(c);

h=abs(Onpix-Cnpix);

 MaxDev = (h(1)+h(256))/2 + sum(h(2:255));

DC=mean(h);

AC= abs(h-DC);

IrreDev=sum(AC);

DUH=sum(abs(Cnpix-256))/(256*256);

