clear all
close all
A=uint8(abs(load('lbe32.txt')));
B=uint8(abs(load('lbe64.txt')));
l=length(A);
sizesample=6000;
movmeansample=300;

set(groot,'defaultAxesXGrid','on')
set(groot,'defaultAxesYGrid','on')

for i=1:l 
    if isnan(A(i,1))==true
        
      A(i,1)=1;     
     
    end
end 
a=imread('lena-256x256.jpg'); 
b=imread('barb.jpg'); 
c=imread('boat.jpg'); 
d=imread('mandrill.jpg'); 
e=imread('student.jpg')

[ca xa]=imhist(a);
[cb xb]=imhist(b);
[cc xc]=imhist(c);
[cd xd]=imhist(d);
[ce xe]=imhist(e);

countVariance_a = var(ca);
countVariance_b = var(cb);
countVariance_c = var(cc);
countVariance_d = var(cd);
countVariance_e = var(ce);

countVariance_a32 = zeros(1,sizesample);
countVariance_b32 = zeros(1,sizesample);
countVariance_c32 = zeros(1,sizesample);
countVariance_d32 = zeros(1,sizesample);
countVariance_e32 = zeros(1,sizesample);

countVariance_a64 = zeros(1,sizesample);
countVariance_b64 = zeros(1,sizesample);
countVariance_c64 = zeros(1,sizesample);
countVariance_d64 = zeros(1,sizesample);
countVariance_e64 = zeros(1,sizesample);

j=1

while(j<= 8000)
f=A(1+j: j+256*256);          
g=f';
h=vec2mat(g,256);


cryptImage32_lena=bitxor(a,h,'uint8');
cryptImage32_barb=bitxor(b,h,'uint8');
cryptImage32_boat=bitxor(c,h,'uint8');
cryptImage32_mandrill=bitxor(d,h,'uint8');
cryptImage32_student=bitxor(e,h,'uint8');

[ca32 xa]=imhist(cryptImage32_lena);
[cb32 xb]=imhist(cryptImage32_barb);
[cc32 xc]=imhist(cryptImage32_boat);
[cd32 xd]=imhist(cryptImage32_mandrill);
[ce32 xe]=imhist(cryptImage32_student);

countVariance_a32(1,j)=var(ca32);
countVariance_b32(1,j)=var(cb32);
countVariance_c32(1,j)=var(cc32);
countVariance_d32(1,j)=var(cd32);
countVariance_e32(1,j)=var(ce32);


F=B(1+j: j+256*256);          
G=F';
H=vec2mat(G,256);

cryptImage64_lena=bitxor(a,H,'uint8');
cryptImage64_barb=bitxor(b,H,'uint8');
cryptImage64_boat=bitxor(c,H,'uint8');
cryptImage64_mandrill=bitxor(d,H,'uint8');
cryptImage64_student=bitxor(e,H,'uint8');

[ca64 xa]=imhist(cryptImage64_lena);
[cb64 xb]=imhist(cryptImage64_barb);
[cc64 xc]=imhist(cryptImage64_boat);
[cd64 xd]=imhist(cryptImage64_mandrill);
[ce64 xe]=imhist(cryptImage64_student);

countVariance_a64(1,j)=var(ca64);
countVariance_b64(1,j)=var(cb64);
countVariance_c64(1,j)=var(cc64);
countVariance_d64(1,j)=var(cd64);
countVariance_e64(1,j)=var(ce64);

%imshow(cryptImage);
j=j+1;
end

figure(1)
plot(movmean(countVariance_a64(1,1:end),movmeansample));
hold on
plot(movmean(countVariance_a32(1,1:end),movmeansample));
legend('64 bits','32 bits','Location','NorthEast','FontSize', 24);
set(gca, 'FontName', 'Times New Roman','Fontsize',22)
xlabel('$T_sS$','Interpreter','latex','FontSize', 24)
ylabel('$Variance$','Interpreter','latex','FontSize', 24)
print('../../../figs/resultados/Histogramas/CONFUSAO/lena_histogram','-depsc');
drawnow;


figure(2)
plot(movmean(countVariance_b64(1,1:end),movmeansample));
hold on
plot(movmean(countVariance_b32(1,1:end),movmeansample));
grid on

legend('64 bits','32 bits','Location','NorthEast','FontSize', 24);
set(gca, 'FontName', 'Times New Roman','Fontsize',22)
xlabel('$T_s$','Interpreter','latex','FontSize', 24)
ylabel('$Variance$','Interpreter','latex','FontSize', 24)
print('../../../figs/resultados/Histogramas/CONFUSAO/barb_histogram','-depsc');
drawnow;

figure(3)
plot(movmean(countVariance_c64(1,1:end),movmeansample));
hold on
plot(movmean(countVariance_c32(1,1:end),movmeansample));
grid on

legend('64 bits','32 bits','Location','NorthEast','FontSize', 24);
set(gca, 'FontName', 'Times New Roman','Fontsize',22)
xlabel('$T_s$','Interpreter','latex','FontSize', 24)
ylabel('$Variance$','Interpreter','latex','FontSize', 24)
print('../../../figs/resultados/Histogramas/CONFUSAO/boat_histogram','-depsc');
drawnow;


figure(4)
plot(movmean(countVariance_d64(1,1:end),movmeansample));
hold on
plot(movmean(countVariance_d32(1,1:end),movmeansample));
legend('32 bits','64 bits','Location','NorthEast','FontSize', 24);
grid on

set(gca, 'FontName', 'Times New Roman','Fontsize',22)
xlabel('$T_s$','Interpreter','latex','FontSize', 24)
ylabel('$Variance$','Interpreter','latex','FontSize', 24)
print('../../../figs/resultados/Histogramas/CONFUSAO/mandrill_histogram','-depsc');
drawnow;


figure(5)
plot(movmean(countVariance_e64(1,1:end),movmeansample));
hold on
plot(movmean(countVariance_e32(1,1:end),movmeansample));
grid on

legend('64 bits','32 bits','Location','NorthEast','FontSize', 24);
set(gca, 'FontName', 'Times New Roman','Fontsize',22)
xlabel('$T_s$','Interpreter','latex','FontSize', 24)
ylabel('$Variance$','Interpreter','latex','FontSize', 24)
print('../../../figs/resultados/Histogramas/CONFUSAO/student_histogram','-depsc');
drawnow;

figure(6)
imshow(a)
print('../../../figs/resultados/Histogramas/CONFUSAO/lena','-depsc');
drawnow

figure(7)
imshow(b)
print('../../../figs/resultados/Histogramas/CONFUSAO/barb','-depsc');
drawnow


figure(8)
imshow(c)
print('../../../figs/resultados/Histogramas/CONFUSAO/boat','-depsc')
drawnow

figure(9)
imshow(d)
print('../../../figs/resultados/Histogramas/CONFUSAO/mandrill','-depsc')
drawnow

figure(10)
imshow(e)
print('../../../figs/resultados/Histogramas/CONFUSAO/student','-depsc')

%%% histogramas
figure(11)
imhist(a)
subtitle(sprintf('$e=%f$',countVariance_a),'Interpreter','latex','FontSize', 20)
print('../../../figs/resultados/Histogramas/CONFUSAO/lena_h','-depsc');
drawnow

figure(12)
imhist(b)
subtitle(sprintf('$e=%f$',countVariance_b),'Interpreter','latex','FontSize', 20)
print('../../../figs/resultados/Histogramas/CONFUSAO/barb_h','-depsc');
drawnow

figure(13)
imhist(c)

subtitle(sprintf('$e=%f$',countVariance_c),'Interpreter','latex','FontSize', 20)
print('../../../figs/resultados/Histogramas/CONFUSAO/boat_h','-depsc');
drawnow

figure(14)
imhist(d)
subtitle(sprintf('$e=%f$',countVariance_d),'Interpreter','latex','FontSize', 20)
print('../../../figs/resultados/Histogramas/CONFUSAO/mandrill_h','-depsc');
drawnow


figure(15)
imhist(e)
subtitle(sprintf('$e=%f$',countVariance_e),'Interpreter','latex','FontSize', 20)
print('../../../figs/resultados/Histogramas/CONFUSAO/student_h','-depsc');
drawnow
close all
clear all

results = NPCR_and_UACI( i, j, 1, 255 );

