clear all
close all
nm=8;
nl=8;
nlegen=9;
a=imread('../../../imagens/House.tiff');
b=imread('../../../imagens/Boat.tiff');
c=imread('../../../imagens/Pepper.tiff');
d=imread('../../../imagens/Cman.tiff');

A=uint8(abs(load('../../../mod/House.fsmod')));
Aboat=uint8(abs(load('../../../mod/Boat.fsmod')));
Apepper=uint8(abs(load('../../../mod/Pepper.fsmod')));
ACman=uint8(abs(load('../../../mod/Cman.fsmod')));


B=uint8(abs(load('../../../mod/House.fdmod')));
Bboat=uint8(abs(load('../../../mod/Boat.fdmod')));
Bpepper=uint8(abs(load('../../../mod/Pepper.fdmod')));
BCman=uint8(abs(load('../../../mod/Cman.fdmod')));

l=length(A);
sizesample=24000;
movmeansample=300;

set(groot,'defaultAxesXGrid','on')
set(groot,'defaultAxesYGrid','on')
MaxDev_House = zeros(1,sizesample);
IrreDev_House = zeros(1,sizesample);
DUH_House = zeros(1,sizesample);
for i=1:l
    if isnan(A(i,1))==true

      A(i,1)=1;

    end
end



[ca xa]=imhist(a);
[cb xb]=imhist(b);
[cc xc]=imhist(c);
[cd xd]=imhist(d);

countVariance_a = var(ca);
countVariance_b = var(cb);
countVariance_c = var(cc);
countVariance_d = var(cd);

countVariance_a32 = zeros(1,sizesample);
countVariance_b32 = zeros(1,sizesample);
countVariance_c32 = zeros(1,sizesample);
countVariance_d32 = zeros(1,sizesample);

countVariance_a64 = zeros(1,sizesample);
countVariance_b64 = zeros(1,sizesample);
countVariance_c64 = zeros(1,sizesample);
countVariance_d64 = zeros(1,sizesample);

countChi2_a32 = zeros(1,sizesample);
countChi2_b32 = zeros(1,sizesample);
countChi2_c32 = zeros(1,sizesample);
countChi2_d32 = zeros(1,sizesample);

countChi2_a64 = zeros(1,sizesample);
countChi2_b64 = zeros(1,sizesample);
countChi2_c64 = zeros(1,sizesample);
countChi2_d64 = zeros(1,sizesample);

j=1;

while(j<= 24000)


fHouse=A(1+j: j+256*256);
gHouse=fHouse';
hHouse=vec2mat(gHouse,256);



fboat=Aboat(1+j: j+256*256);
gboat=fboat';
hboat=vec2mat(gboat,256);


fpepper=Apepper(1+j: j+256*256);
gpepper=fpepper';
hpepper=vec2mat(gpepper,256);


fCman=ACman(1+j: j+256*256);
gCman=fCman';
hCman=vec2mat(gCman,256);



cryptImage32_House=bitxor(a,hHouse,'uint8');
cryptImage32_boat=bitxor(b,hboat,'uint8');
cryptImage32_pepper=bitxor(c,hpepper,'uint8');
cryptImage32_Cman=bitxor(d,hCman,'uint8');

% [MaxDev_fHouse(j),     IrreDev_fHouse(j),     DUH_fHouse(j)] = deviationsEncryption(a,cryptImage32_House);
% [MaxDev_fboat(j),     IrreDev_fboat(j),     DUH_fboat(j)] = deviationsEncryption(b,cryptImage32_boat);
% [MaxDev_fpepper(j),   IrreDev_fpepper(j),     DUH_fpepper(j)] = deviationsEncryption(c,cryptImage32_pepper);
% [MaxDev_fCman(j), IrreDev_fCman(j), DUH_fCman(j)] = deviationsEncryption(d,cryptImage32_Cman);


[ca32 xa]=imhist(cryptImage32_House);
[cb32 xb]=imhist(cryptImage32_boat);
[cc32 xc]=imhist(cryptImage32_pepper);
[cd32 xd]=imhist(cryptImage32_Cman);



countVariance_a32(1,j)=var(ca32);
countVariance_b32(1,j)=var(cb32);
countVariance_c32(1,j)=var(cc32);
countVariance_d32(1,j)=var(cd32);


FHouse=B(1+j: j+256*256);
GHouse=FHouse';
HHouse=vec2mat(GHouse,256);
% %%
Fboat=Bboat(1+j: j+256*256);
Gboat=Fboat';
Hboat=vec2mat(Gboat,256);
%
Fpepper=Bpepper(1+j: j+256*256);
Gpepper=Fpepper';
Hpepper=vec2mat(Gpepper,256);
%

FCman=BCman(1+j: j+256*256);
GCman=FCman';
HCman=vec2mat(GCman,256);
%

cryptImage64_House=bitxor(a,HHouse,'uint8');
cryptImage64_boat=bitxor(b,Hboat,'uint8');
cryptImage64_pepper=bitxor(c,Hpepper,'uint8');
cryptImage64_Cman=bitxor(d,HCman,'uint8');

%
% [MaxDev_dHouse(j),     IrreDev_dHouse(j),     DUH_dHouse(j)] =     deviationsEncryption(a,cryptImage64_House);
% [MaxDev_dboat(j),     IrreDev_dboat(j),     DUH_dboat(j)] =     deviationsEncryption(b,cryptImage64_boat);
% [MaxDev_dpepper(j),     IrreDev_dpepper(j),     DUH_dpepper(j)] =     deviationsEncryption(c,cryptImage64_pepper);
% [MaxDev_dCman(j), IrreDev_dCman(j), DUH_dCman(j)] = deviationsEncryption(d,cryptImage64_Cman);


[ca64 xa]=imhist(cryptImage64_House);
[cb64 xb]=imhist(cryptImage64_boat);
[cc64 xc]=imhist(cryptImage64_pepper);
[cd64 xd]=imhist(cryptImage64_Cman);

countVariance_a64(1,j)=var(ca64);
countVariance_b64(1,j)=var(cb64);
countVariance_c64(1,j)=var(cc64);
countVariance_d64(1,j)=var(cd64);


countChi2_a32(1,j)=mychi2(cryptImage32_House);
countChi2_b32(1,j)=mychi2(cryptImage32_boat);
countChi2_c32(1,j)=mychi2(cryptImage32_pepper);
countChi2_d32(1,j)=mychi2(cryptImage32_Cman);
countChi2_a64(1,j)=mychi2(cryptImage64_House);
countChi2_b64(1,j)=mychi2(cryptImage64_boat);
countChi2_c64(1,j)=mychi2(cryptImage64_pepper);
countChi2_d64(1,j)=mychi2(cryptImage64_Cman);


j=j+1;
end
%
% DataHist=zeros(8,3)
% DataHist(1,:)= [mean(MaxDev_fHouse) mean(IrreDev_fHouse) mean(DUH_fHouse)]
% DataHist(2,:)= [mean(MaxDev_fboat) mean(IrreDev_fboat) mean(DUH_fboat)]
% DataHist(3,:)= [mean(MaxDev_fpepper) mean(IrreDev_fpepper) mean(DUH_fpepper)]
% DataHist(4,:)= [mean(MaxDev_fCman) mean(IrreDev_fCman) mean(DUH_fCman)]
% DataHist(5,:)= [mean(MaxDev_dHouse) mean(IrreDev_dHouse) mean(DUH_dHouse)]
% DataHist(6,:)= [mean(MaxDev_dboat) mean(IrreDev_dboat) mean(DUH_dboat)]
% DataHist(7,:)= [mean(MaxDev_dpepper) mean(IrreDev_dpepper) mean(DUH_dpepper)]
% DataHist(8,:)= [mean(MaxDev_dCman) mean(IrreDev_dCman) mean(DUH_dCman)]


% [xl32,yl32,xl64,yl64, %%axispl,dataAn(1,1:8)]  = interv(countVariance_a32,countVariance_a64,0.01,300,24000,6000)
% [xl32,yl32,xl64,yl64, %axispl,dataAn(2,1:8)]  = interv(countVariance_b32,countVariance_b64,0.01,300,24000,6000)
% [xl32,yl32,xl64,yl64, %axispl,dataAn(3,1:8)]  = interv(countVariance_c32,countVariance_c64,0.01,300,24000,6000)
% [xl32,yl32,xl64,yl64, %axispl,dataAn(4,1:8)]  = interv(countVariance_d32,countVariance_d64,0.01,300,24000,6000)


sa32=movmean(countVariance_a32(1,1:13000),movmeansample);
sa64=movmean(countVariance_a64(1,1:13000),movmeansample);

sb32=movmean(countVariance_b32(1,1:13000),movmeansample);
sb64=movmean(countVariance_b64(1,1:13000),movmeansample);

sc32=movmean(countVariance_c32(1,1:13000),movmeansample);
sc64=movmean(countVariance_c64(1,1:13000),movmeansample);

sd32=movmean(countVariance_d32(1,1:13000),movmeansample);
sd64=movmean(countVariance_d64(1,1:13000),movmeansample);

chi2a32=movmean(countChi2_a32(1,1:13000),movmeansample);
chi2a64=movmean(countChi2_a64(1,1:13000),movmeansample);
chi2b32=movmean(countChi2_b32(1,1:13000),movmeansample);
chi2b64=movmean(countChi2_b64(1,1:13000),movmeansample);
chi2c32=movmean(countChi2_c32(1,1:13000),movmeansample);
chi2c64=movmean(countChi2_c64(1,1:13000),movmeansample);
chi2d32=movmean(countChi2_d32(1,1:13000),movmeansample);
chi2d64=movmean(countChi2_d64(1,1:13000),movmeansample);


width=2.5;
height = width * (3/4);
f1=figure(1)
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:6000,sa32(1:100:6000));
hold on
plot(1:100:6000,sa64(1:100:6000));
hold on
yline(256,'-')
hold on
axis([0 6000 240 300])
grid on;
legend('32 bits','64 bits','Location','NorthEast','FontSize', nlegen);
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('\(\sigma^2\)','Interpreter','latex','FontSize', nl)
matlab2tikz('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Journal/Figuras/resultados/Histogramas/tikz/House_var.tikz', 'figurehandle', f1);

drawnow;


f2=figure(2)
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:6000,sb32(1:100:6000));
hold on;
plot(1:100:6000,sb64(1:100:6000));
hold on;
yline(256,'-')
hold on;
axis([0 6000 240 300])
grid on;
legend('32 bits','64 bits','Location','NorthEast','FontSize', nlegen);
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('\(\sigma^2\)','Interpreter','latex','FontSize', nl)
matlab2tikz('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Journal/Figuras/resultados/Histogramas/tikz/Boat_var.tikz', 'figurehandle', f2);

drawnow;


f3=figure(3)
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:6000,sc32(1:100:6000));
hold on
plot(1:100:6000,sc64(1:100:6000));
hold on
yline(256,'-')
hold on
axis([0 6000 240 300])
grid on;
legend('32 bits','64 bits','Location','NorthEast','FontSize', nlegen);
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('\(\sigma^2\)','Interpreter','latex','FontSize', nl)
matlab2tikz('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Journal/Figuras/resultados/Histogramas/tikz/Pepper_var.tikz', 'figurehandle', f3);

drawnow;


f4=figure(4)
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:6000,sd32(1:100:6000));
hold on
plot(1:100:6000,sd64(1:100:6000));
hold on
yline(256,'-')
hold on
axis([0 6000 240 300])
grid on;
legend('32 bits','64 bits','Location','NorthEast','FontSize', nlegen);
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('\(\sigma^2\)','Interpreter','latex','FontSize', nl)
matlab2tikz('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Journal/Figuras/resultados/Histogramas/tikz/Cman_var.tikz', 'figurehandle', f4);

drawnow;


f5=figure(5)
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:6000,chi2a32(1:100:6000));
hold on
plot(1:100:6000,chi2a64(1:100:6000));
hold on
yline(256,'-')
hold on
axis([0 6000 240 300])
grid on;
legend('32 bits','64 bits','Location','NorthEast','FontSize', nlegen);
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('\(\chi^2\)','Interpreter','latex','FontSize', nl)
matlab2tikz('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Journal/Figuras/resultados/Histogramas/tikz/House_chi2.tikz', 'figurehandle', f5);

drawnow;


f6=figure(6)
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:6000,chi2b32(1:100:6000));
hold on;
plot(1:100:6000,chi2b64(1:100:6000));
hold on;
yline(256,'-')
hold on;
axis([0 6000 240 300])
grid on;
legend('32 bits','64 bits','Location','NorthEast','FontSize', nlegen);
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('\(\chi^2\)','Interpreter','latex','FontSize', nl)
matlab2tikz('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Journal/Figuras/resultados/Histogramas/tikz/Boat_chi2.tikz', 'figurehandle', f6);

drawnow;


f7=figure(7)
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:6000,chi2c32(1:100:6000));
hold on
plot(1:100:6000,chi2c64(1:100:6000));
hold on
yline(256,'-')
hold on
axis([0 6000 240 300])
grid on;
legend('32 bits','64 bits','Location','NorthEast','FontSize', nlegen);
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('\(\chi^2\)','Interpreter','latex','FontSize', nl)
matlab2tikz('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Journal/Figuras/resultados/Histogramas/tikz/Pepper_chi2.tikz', 'figurehandle', f7);

drawnow;


f8=figure(8)
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:6000,chi2d32(1:100:6000));
hold on
plot(1:100:6000,chi2d64(1:100:6000));
hold on
yline(256,'-')
hold on
axis([0 6000 240 300])
grid on;
legend('32 bits','64 bits','Location','NorthEast','FontSize', nlegen);
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('\(\chi^2\)','Interpreter','latex','FontSize', nl)
matlab2tikz('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Journal/Figuras/resultados/Histogramas/tikz/Cman_chi2.tikz', 'figurehandle', f8);

drawnow;
close all;

