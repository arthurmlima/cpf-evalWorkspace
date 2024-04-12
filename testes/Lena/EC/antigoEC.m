clear all
close all
A=uint8(abs(load('../../../Data/mods_8bits/lenaLBE32.txt')));
l=length(A);

for i=1:l 
    if isnan(A(i,1))==true        
      A(i,1)=1;     
    end
end 
a=imread('../../../Data/imagens/lena.jpg'); 


fin=0;
j=0;
while(fin==0)

f=A(1+j: j+256*256);          
%f=e(aux1: aux1+262143);        % Para as imagens Branca e Preta
g=f';
h=vec2mat(g,256);

cryptImage=bitxor(a,h,'uint8');

entropia=entropy(cryptImage);

%imshow(cryptImage);
j=j+1;
if (j+256*256==90000)
    fin=1;
end
entrop32(j)=entropia;

I = im2double(cryptImage);
c_diag = corrcoef(I(1:end-1, 1:end-1), I(2:end, 2:end));
c_vert = corrcoef(I(1:end-1, :), I(2:end, :));
c_horz = corrcoef(I(:, 1:end-1), I(:, 2:end));

vert32(j)=c_vert(1,2);
horz32(j)=c_horz(1,2);
diag32(j)=c_diag(1,2);

j
end

H_32=entrop32;

Mentrop132 = movmean(entrop32,1000);

Mvert132 = movmean(vert32,1000);
Mhorz132 = movmean(horz32,1000);
Mdiag132 = movmean(diag32,1000);




nm=18;
nl=22;

f1=figure(1)
pos=f1.Position;
% pos(3)=pos(3)*1.4;
% pos(4)=pos(4)*0.75;
% set(gcf,'Position',pos)
subplot(2,1,1);
plot(vert32);
hold on;
plot(horz32);
hold on 
plot(diag32);
hold on
legend('Vertical','Horizontal','Diagonal','Location','NorthEast','FontSize', 14);
%axis([0 15000 0 0.022])
grid on
 set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
 xlabel('$tr$','Interpreter','latex','FontSize', nl)
 ylabel('Corr. coefficients','Interpreter','latex','FontSize',nl)
 print('./correlation_32','-depsc')
 subplot(2,1,2);
plot(Mvert132);
hold on;
plot(Mhorz132);
hold on 
plot(Mdiag132);
hold on
legend('Vertical','Horizontal','Diagonal','Location','NorthEast','FontSize', 14);
%axis([0 15000 0 0.022])
grid on
 set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
 xlabel('$tr$','Interpreter','latex','FontSize', nl)
 ylabel('Corr. coefficients','Interpreter','latex','FontSize',nl)
 print('./correlation_32','-depsc')
 
 drawnow;




A=uint8(abs(load('../../../Data/mods_8bits/lenaLBE64.txt')));
l=length(A);

for i=1:l 
    if isnan(A(i,1))==true
        
      A(i,1)=1;     
     
    end
end 
a=imread('../../../Data/imagens/lena.jpg'); 

fin=0;
j=0;
while(fin==0)

f=A(1+j: j+256*256);          
%f=e(aux1: aux1+262143);        % Para as imagens Branca e Preta
g=f';
h=vec2mat(g,256);

cryptImage=bitxor(a,h,'uint8');

entropia=entropy(cryptImage);

%imshow(cryptImage);
j=j+1;
if (j+256*256==90000)
    fin=1;
end
entrop64(j)=entropia;

I = im2double(cryptImage);
c_diag = corrcoef(I(1:end-1, 1:end-1), I(2:end, 2:end));
c_vert = corrcoef(I(1:end-1, :), I(2:end, :));
c_horz = corrcoef(I(:, 1:end-1), I(:, 2:end));

vert64(j)=c_vert(1,2);
horz64(j)=c_horz(1,2);
diag64(j)=c_diag(1,2);

j
end

J=zeros(23000,1);

H_32=entrop32;


Mentrop2 = movmean(entrop64,1000);

Mvert2 = movmean(vert64,1000);
Mhorz2 = movmean(horz64,1000);
Mdiag2 = movmean(diag64,1000);


f1=figure(2);
% pos=f1.Position;
% pos(3)=pos(3)*1.4;
% pos(4)=pos(4)*0.75;
%set(gcf,'Position',pos)
subplot(2,1,1);

plot(Mentrop132(1:12000));
hold on ;
plot(Mentrop2(1:12000));
grid on
legend('32 bits','64 bits','Location','SouthEast','FontSize', 14);
set(gcf,'Position',pos)
%axis([0 12000 7.9969 7.99725])
 set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
 xlabel('$tr$','Interpreter','latex','FontSize', nl)
 ylabel('Entropy','Interpreter','latex','FontSize', nl)
 print('./entropy','-depsc')
 %print('../../../TCASI2021/figs/resultados/CorrelacaoEntropia/Entropy','-depsc')
subplot(2,1,2);
 plot(entrop32(1:12000));
hold on ;
plot(entrop64(1:12000));
grid on
legend('32 bits','64 bits','Location','SouthEast','FontSize', 14);
set(gcf,'Position',pos)
%axis([0 12000 7.9969 7.99725])
 set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
 xlabel('$tr$','Interpreter','latex','FontSize', nl)
 ylabel('Entropy','Interpreter','latex','FontSize', nl)
 print('./entropy','-depsc')
 %print('../../../TCASI2021/figs/resultados/CorrelacaoEntropia/Entropy','-depsc')
 
 
 
 drawnow;


f1=figure(3);
% pos=f1.Position;
% pos(3)=pos(3)*1.4;
% pos(4)=pos(4)*0.75;
% set(gcf,'Position',pos)
subplot(2,1,1);
plot(vert64);
hold on;
plot(horz64);
hold on 
plot(diag64);
hold on
legend('Vertical','Horizontal','Diagonal','Location','NorthEast','FontSize', 14);
%axis([0 15000 0 0.022])
grid on
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('Corr. coefficients','Interpreter','latex','FontSize', nl)
print('./correlation_64','-depsc')
%print('../../../TCASI2021/figs/resultados/CorrelacaoEntropia/correlation_64','-depsc')
subplot(2,1,2);
plot(Mvert2);
hold on;
plot(Mhorz2);
hold on 
plot(Mdiag2);
hold on
legend('Vertical','Horizontal','Diagonal','Location','NorthEast','FontSize', 14);
%axis([0 15000 0 0.022])
grid on
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('Corr. coefficients','Interpreter','latex','FontSize', nl)
print('./correlation_64','-depsc')
%print('../../../TCASI2021/figs/resultados/CorrelacaoEntropia/correlation_64','-depsc')

drawnow;

figure(4) 
plot(entrop64(9000:11000), 'o');
hold on
plot(entrop32(9000:11000), '*');
 drawnow;

 
 
 
 
 
 
 
 
 
 
for K=1:23000
    J(K)=(abs(vert(K))+abs(horz(K))+abs(diag(K)))/3;
end 

[Jmin trmin] = min(J);
H_64=entrop;
fprintf('%.6f  %.6f  %.6f\n',vert(trmin), horz(trmin), diag(trmin));

