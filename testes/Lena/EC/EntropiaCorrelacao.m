clear all
close all
A=uint8(abs(load('../../../mod/House.fsmod')));
l=length(A);
nm=8;
nl=8;
nlegen=9;

width=7.6/3.4;
height = (3.1/4)*width;


for i=1:l
    if isnan(A(i,1))==true
      A(i,1)=1;
    end
end
a=imread('../../../imagens/House.tiff');


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






f1=figure(5)
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:7000,Mvert132(1:100:7000));
hold on;
plot(1:100:7000,Mhorz132(1:100:7000));
hold on
plot(1:100:7000,Mdiag132(1:100:7000));
hold on
axis([0 7000 -5e-3 15e-3])
grid on
legend('Ver.','Hor.','Diag.','Location','NorthEast','FontSize', nlegen);
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('(32-bits) Corr. Coeff.','Interpreter','latex','FontSize',nl)
matlab2tikz('C:/Users/arthu/Dropbox/Apps/Overleaf/24ChuaFP/Figuras/resultados/Correlacao/tikz/House_correlation_32.tikz','extraAxisOptions', {
                'ylabel near ticks', ...
            });

drawnow;




A=uint8(abs(load('../../../mod/House.fdmod')));
l=length(A);

for i=1:l
    if isnan(A(i,1))==true

      A(i,1)=1;

    end
end

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


end

J=zeros(23000,1);

H_32=entrop32;


Mentrop2 = movmean(entrop64,1000);

Mvert2 = movmean(vert64,1000);
Mhorz2 = movmean(horz64,1000);
Mdiag2 = movmean(diag64,1000);


f1=figure(6);
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:10000,Mentrop132(1:100:10000));
hold on ;
plot(1:100:10000,Mentrop2(1:100:10000));
grid on
legend('32 bits','64 bits','Location','SouthEast','FontSize', nlegen);
axis([0 10000 7.9970 7.99722])
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('Entropy','Interpreter','latex','FontSize', nl)
matlab2tikz('C:/Users/arthu/Dropbox/Apps/Overleaf/24ChuaFP/Figuras/resultados/Entropia/tikz/House_entropy.tikz','extraAxisOptions', {
                'ylabel near ticks', ...
                'yticklabel style={/pgf/number format/.cd, fixed, fixed zerofill, precision=4}' ...
            });

drawnow;


f1=figure(7);
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);


plot(1:100:7000,Mvert2(1:100:7000));
hold on;
plot(1:100:7000,Mhorz2(1:100:7000));
hold on
plot(1:100:7000,Mdiag2(1:100:7000));
hold on
legend('Ver.','Hor.','Diag.','Location','NorthEast','FontSize', nlegen);
axis([0 7000 -5e-3 15e-3])
grid on
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('(64-bits) Corr. Coeff.','Interpreter','latex','FontSize', nl)
matlab2tikz('C:/Users/arthu/Dropbox/Apps/Overleaf/24ChuaFP/Figuras/resultados/Correlacao/tikz/House_correlation_64.tikz','extraAxisOptions', {
                'ylabel near ticks', ...
            });

drawnow;





close all;








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



















clear all
close all
A=uint8(abs(load('../../../mod/Boat.fsmod')));
l=length(A);
nm=8;
nl=8;
nlegen=9;
width=7.6/3.4;
height = (3.1/4)*width;

for i=1:l
    if isnan(A(i,1))==true
      A(i,1)=1;
    end
end
a=imread('../../../imagens/Boat.tiff');


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






f1=figure(5)
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:7000,Mvert132(1:100:7000));
hold on;
plot(1:100:7000,Mhorz132(1:100:7000));
hold on
plot(1:100:7000,Mdiag132(1:100:7000));
hold on
axis([0 7000 -5e-3 15e-3])
grid on
legend('Ver.','Hor.','Diag.','Location','NorthEast','FontSize', nlegen);
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('(32-bits) Corr. Coeff.','Interpreter','latex','FontSize',nl)
matlab2tikz('C:/Users/arthu/Dropbox/Apps/Overleaf/24ChuaFP/Figuras/resultados/Correlacao/tikz/Boat_correlation_32.tikz','extraAxisOptions', {
                'ylabel near ticks', ...
            });

drawnow;




A=uint8(abs(load('../../../mod/Boat.fdmod')));
l=length(A);

for i=1:l
    if isnan(A(i,1))==true

      A(i,1)=1;

    end
end

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


f1=figure(6);
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:10000,Mentrop132(1:100:10000));
hold on ;
plot(1:100:10000,Mentrop2(1:100:10000));
grid on
legend('32 bits','64 bits','Location','SouthEast','FontSize', nlegen);
axis([0 10000 7.9970 7.99722])
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('Entropy','Interpreter','latex','FontSize', nl)
matlab2tikz('C:/Users/arthu/Dropbox/Apps/Overleaf/24ChuaFP/Figuras/resultados/Entropia/tikz/Boat_entropy.tikz','extraAxisOptions', {
                'ylabel near ticks', ...
                'yticklabel style={/pgf/number format/.cd, fixed, fixed zerofill, precision=4}' ...
            });

drawnow;


f1=figure(7);
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);


plot(1:100:7000,Mvert2(1:100:7000));
hold on;
plot(1:100:7000,Mhorz2(1:100:7000));
hold on
plot(1:100:7000,Mdiag2(1:100:7000));
hold on
legend('Ver.','Hor.','Diag.','Location','NorthEast','FontSize', nlegen);
axis([0 7000 -5e-3 15e-3])
grid on
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('(64-bits) Corr. Coeff.','Interpreter','latex','FontSize', nl)
matlab2tikz('C:/Users/arthu/Dropbox/Apps/Overleaf/24ChuaFP/Figuras/resultados/Correlacao/tikz/Boat_correlation_64.tikz','extraAxisOptions', {
                'ylabel near ticks', ...
            });

drawnow;





close all;








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



















clear all
close all
A=uint8(abs(load('../../../mod/Pepper.fsmod')));
l=length(A);
nm=8;
nl=8;
nlegen=9;
width=7.6/3.4;
height = (3.1/4)*width;

for i=1:l
    if isnan(A(i,1))==true
      A(i,1)=1;
    end
end
a=imread('../../../imagens/Pepper.tiff');


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






f1=figure(5)
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:7000,Mvert132(1:100:7000));
hold on;
plot(1:100:7000,Mhorz132(1:100:7000));
hold on
plot(1:100:7000,Mdiag132(1:100:7000));
hold on
axis([0 7000 -5e-3 15e-3])
grid on
legend('Ver.','Hor.','Diag.','Location','NorthEast','FontSize', nlegen);
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('(32-bits) Corr. Coeff.','Interpreter','latex','FontSize',nl)
matlab2tikz('C:\Users\arthu\Dropbox\Apps\Overleaf\24ChuaFP/Figuras/resultados/Correlacao/tikz/Pepper_correlation_32.tikz','extraAxisOptions', {
                'ylabel near ticks', ...
            });

drawnow;




A=uint8(abs(load('../../../mod/Pepper.fdmod')));
l=length(A);

for i=1:l
    if isnan(A(i,1))==true

      A(i,1)=1;

    end
end

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


f1=figure(6);
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:10000,Mentrop132(1:100:10000));
hold on ;
plot(1:100:10000,Mentrop2(1:100:10000));
grid on
legend('32 bits','64 bits','Location','SouthEast','FontSize', nlegen);
axis([0 10000 7.9970 7.99722])
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('Entropy','Interpreter','latex','FontSize', nl)
matlab2tikz('C:\Users\arthu\Dropbox\Apps\Overleaf\24ChuaFP/Figuras/resultados/Entropia/tikz/Pepper_entropy.tikz','extraAxisOptions', {
                'ylabel near ticks', ...
                'yticklabel style={/pgf/number format/.cd, fixed, fixed zerofill, precision=4}' ...
            });

drawnow;


f1=figure(7);
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);


plot(1:100:7000,Mvert2(1:100:7000));
hold on;
plot(1:100:7000,Mhorz2(1:100:7000));
hold on
plot(1:100:7000,Mdiag2(1:100:7000));
hold on
legend('Ver.','Hor.','Diag.','Location','NorthEast','FontSize', nlegen);
axis([0 7000 -5e-3 15e-3])
grid on
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('(64-bits) Corr. Coeff.','Interpreter','latex','FontSize', nl)
matlab2tikz('C:\Users\arthu\Dropbox\Apps\Overleaf\24ChuaFP/Figuras/resultados/Correlacao/tikz/Pepper_correlation_64.tikz','extraAxisOptions', {
                'ylabel near ticks', ...
            });

drawnow;






close all;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



















clear all
close all
A=uint8(abs(load('../../../mod/Cman.fsmod')));
l=length(A);
nm=8;
nl=8;
nlegen=9;
width=7.6/3.4;
height = (3.1/4)*width;

for i=1:l
    if isnan(A(i,1))==true
      A(i,1)=1;
    end
end
a=imread('../../../imagens/Cman.tiff');


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






f1=figure(5)
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:7000,Mvert132(1:100:7000));
hold on;
plot(1:100:7000,Mhorz132(1:100:7000));
hold on
plot(1:100:7000,Mdiag132(1:100:7000));
hold on
axis([0 7000 -5e-3 15e-3])
grid on
legend('Ver.','Hor.','Diag.','Location','NorthEast','FontSize', nlegen);
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('(32-bits) Corr. Coeff.','Interpreter','latex','FontSize',nl)
matlab2tikz('C:\Users\arthu\Dropbox\Apps\Overleaf\24ChuaFP/Figuras/resultados/Correlacao/tikz/Cman_correlation_32.tikz','extraAxisOptions', {
                'ylabel near ticks', ...
            });

drawnow;




A=uint8(abs(load('../../../mod/Cman.fdmod')));
l=length(A);

for i=1:l
    if isnan(A(i,1))==true

      A(i,1)=1;

    end
end

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


f1=figure(6);
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);
plot(1:100:10000,Mentrop132(1:100:10000));
hold on ;
plot(1:100:10000,Mentrop2(1:100:10000));
grid on
legend('32 bits','64 bits','Location','SouthEast','FontSize', nlegen);
axis([0 10000 7.9970 7.99722])
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('Entropy','Interpreter','latex','FontSize', nl)
matlab2tikz('C:\Users\arthu\Dropbox\Apps\Overleaf\24ChuaFP/Figuras/resultados/Entropia/tikz/Cman_entropy.tikz','extraAxisOptions', {
                'ylabel near ticks', ...
                'yticklabel style={/pgf/number format/.cd, fixed, fixed zerofill, precision=4}' ...
            });

drawnow;


f1=figure(7);
set(gcf, 'Units', 'inches', 'Position', [1, 1, width, height]);


plot(1:100:7000,Mvert2(1:100:7000));
hold on;
plot(1:100:7000,Mhorz2(1:100:7000));
hold on
plot(1:100:7000,Mdiag2(1:100:7000));
hold on
legend('Ver.','Hor.','Diag.','Location','NorthEast','FontSize', nlegen);
axis([0 7000 -5e-3 15e-3])
grid on
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('(64-bits) Corr. Coeff.','Interpreter','latex','FontSize', nl)
matlab2tikz('C:\Users\arthu\Dropbox\Apps\Overleaf\24ChuaFP/Figuras/resultados/Correlacao/tikz/Cman_correlation_64.tikz','extraAxisOptions', {
                'ylabel near ticks', ...
            });

drawnow;

