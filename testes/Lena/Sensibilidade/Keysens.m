clear all;
clc;

nm=14;
nl=18;

%Declaração LBES
lbe32_fmod=uint8(abs(load('../../../mod/Lena.fsmod')));
lbe32_fmod_pow6=uint8(abs(load('../../../modsense/Lena_npow_1.fsmod')));
lbe32_fmod_pow7=uint8(abs(load('../../../modsense/Lena_npow_2.fsmod')));
lbe32_fmod_pow8=uint8(abs(load('../../../modsense/Lena_npow_3.fsmod')));


      lbe64_fmod=uint8(abs(load( '../../../mod/Lena.fdmod'              )));
lbe64_fmod_pow13=uint8(abs(load( '../../../modsense/Lena_npow_1.fdmod' )));
lbe64_fmod_pow14=uint8(abs(load( '../../../modsense/Lena_npow_2.fdmod' )));
lbe64_fmod_pow15=uint8(abs(load( '../../../modsense/Lena_npow_3.fdmod' )));







for i=1:90000 
    if isnan(lbe32_fmod(1,end))==true
      A(1,end)=0;          
    end   
    if isnan(lbe32_fmod_pow6(1,end))==true
      B(1,end)=0;          
    end
    
    if isnan(lbe32_fmod_pow7(1,end))==true
      C(1,end)=0;          
    end
    if isnan(lbe32_fmod_pow8(1,end))==true
      A(1,end)=0;          
    end   

    
    
    if isnan(lbe64_fmod(i,end))==true
      lbe64_fmod(i,end)=0;          
    end

        if isnan(lbe64_fmod_pow13(1,end))==true
      lbe64_fmod_pow13(1,end)=0;          
        end   
    if isnan(lbe64_fmod_pow14(1,end))==true
      lbe64_fmod_pow14(1,end)=0;          
    end
    
    if isnan(lbe64_fmod_pow15(1,end))==true
      lbe64_fmod_pow15(1,end)=0;          
    end
        
  
end 

a=imread('../../../imagens/Lena.tiff'); 
a=a(:,:,1);  %Mudar a a imagem para uma matriz de ordem 2
t=size(a);
% 

percentingSensitive1=zeros(1,90000-256*256);
percentingSensitive2=zeros(1,90000-256*256);
percentingSensitive3=zeros(1,90000-256*256);
percentingSensitive4=zeros(1,90000-256*256);

percentingSensitive12=zeros(1,90000-256*256);
percentingSensitive22=zeros(1,90000-256*256);
percentingSensitive32=zeros(1,90000-256*256);
percentingSensitive42=zeros(1,90000-256*256);



countermax=1;
 while(countermax<=90000-256*256-1 )
    
lbe_original=lbe32_fmod(countermax:countermax+256*256-1); 
lbe_original_transposto=lbe_original';
h=vec2mat(lbe_original_transposto,256);
i=bitxor(a,h,'uint8');



lbe_pw_7=lbe32_fmod_pow6(countermax:countermax+256*256-1); 
lbe_pw_7_transposto=lbe_pw_7';
h_pw_7_transposto=vec2mat(lbe_pw_7_transposto,256);
i2=bitxor(a,h_pw_7_transposto,'uint8');


j=bitxor(i,h_pw_7_transposto,'uint8');

results1 = sensitivity( i, i2, 1, 255 );
results2 = sensitivity( a, j, 1, 255 );
percentingSensitive1(1,countermax)=double(results1.diff1_score);
percentingSensitive12(1,countermax)=double(results2.diff1_score);


countermax=countermax+1;

 end
 countermax=1;
  while(countermax<=90000-256*256-1 )
    
lbe_original=lbe32_fmod(countermax:countermax+256*256-1); 
lbe_original_transposto=lbe_original';
h=vec2mat(lbe_original_transposto,256);
i=bitxor(a,h,'uint8');



lbe_pw_7=lbe32_fmod_pow7(countermax:countermax+256*256-1); 
lbe_pw_7_transposto=lbe_pw_7';
h_pw_7_transposto=vec2mat(lbe_pw_7_transposto,256);
i2=bitxor(a,h_pw_7_transposto,'uint8');


j=bitxor(i,h_pw_7_transposto,'uint8');

results1 = sensitivity( i, i2, 1, 255 );
results2 = sensitivity( a, j, 1, 255 );
percentingSensitive2(1,countermax)=double(results1.diff1_score);
percentingSensitive22(1,countermax)=double(results2.diff1_score);

countermax=countermax+1;

  end
 countermax=1;
  while(countermax<=90000-256*256-1 )
    
lbe_original=lbe32_fmod(countermax:countermax+256*256-1); 
lbe_original_transposto=lbe_original';
h=vec2mat(lbe_original_transposto,256);
i=bitxor(a,h,'uint8');



lbe_pw_7=lbe32_fmod_pow8(countermax:countermax+256*256-1); 
lbe_pw_7_transposto=lbe_pw_7';
h_pw_7_transposto=vec2mat(lbe_pw_7_transposto,256);
i2=bitxor(a,h_pw_7_transposto,'uint8');


j=bitxor(i,h_pw_7_transposto,'uint8');

results1 = sensitivity( i, i2, 1, 255 );
results2 = sensitivity( a, j, 1, 255 );
percentingSensitive3(1,countermax)=double(results1.diff1_score);
percentingSensitive32(1,countermax)=double(results2.diff1_score);

countermax=countermax+1;

  end
 
f1=figure(8);
pos=f1.Position;
pos(3)=pos(3)*1.4;
pos(4)=pos(4)*0.75;
set(gcf,'Position',pos);
plot(movmean(100*percentingSensitive1,300));
hold on 
plot(movmean(100*percentingSensitive2,300));
hold on 
plot(movmean(100*percentingSensitive3,300));
axis([0 12000 99.3 99.65])
grid on
legend('$3 \cdot 10^{-6}$','$3 \cdot 10^{-7}$','$3 \cdot 10^{-8}$','Location','SouthEast','Interpreter','latex','Fontsize',18 )
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr $','Interpreter','latex','FontSize', nl)
ylabel('$ Diff_{1} \: (\%)$','Interpreter','latex','FontSize', nl)
print('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Journal/figs/resultados/Keysensetivity/32_diff1','-depsc');
print('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Conf/figs/resultados/Keysensetivity/32_diff1','-depsc');
drawnow

f1=figure(9);
pos=f1.Position;
pos(3)=pos(3)*1.4;
pos(4)=pos(4)*0.75;
set(gcf,'Position',pos);
plot(movmean(100*percentingSensitive12,300));
hold on 
plot(movmean(100*percentingSensitive22,300));
hold on 
plot(movmean(100*percentingSensitive32,300));
axis([0 12000 99.3 99.65])
grid on

legend('$3 \cdot 10^{-6}$','$3 \cdot 10^{-7}$','$3 \cdot 10^{-8}$','Location','SouthEast','Interpreter','latex','Fontsize',18 )
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('$ Diff_{2} \: (\%)$','Interpreter','latex','FontSize', nl)
print('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Journal/figs/resultados/Keysensetivity/32_diff2','-depsc');
print('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Conf/figs/resultados/Keysensetivity/32_diff2','-depsc');
drawnow;

f32dif1=movmean(100*percentingSensitive3 ,300)
f32dif2=movmean(100*percentingSensitive32,300)



countermax=1;
 while(countermax<=90000-256*256-1 )
    
lbe_original=lbe64_fmod(countermax:countermax+256*256-1); 
lbe_original_transposto=lbe_original';
h=vec2mat(lbe_original_transposto,256);
i=bitxor(a,h,'uint8');



lbe_pw_7=lbe64_fmod_pow13(countermax:countermax+256*256-1); 
lbe_pw_7_transposto=lbe_pw_7';
h_pw_7_transposto=vec2mat(lbe_pw_7_transposto,256);
i2=bitxor(a,h_pw_7_transposto,'uint8');


j=bitxor(i,h_pw_7_transposto,'uint8');

results1 = sensitivity( i, i2, 1, 255 );
results2 = sensitivity( a, j, 1, 255 );
percentingSensitive1(1,countermax)=double(results1.diff1_score);
percentingSensitive12(1,countermax)=double(results2.diff1_score);


countermax=countermax+1;

 end
 countermax=1;
  while(countermax<=90000-256*256-1 )
    
lbe_original=lbe64_fmod(countermax:countermax+256*256-1); 
lbe_original_transposto=lbe_original';
h=vec2mat(lbe_original_transposto,256);
i=bitxor(a,h,'uint8');



lbe_pw_7=lbe64_fmod_pow14(countermax:countermax+256*256-1); 
lbe_pw_7_transposto=lbe_pw_7';
h_pw_7_transposto=vec2mat(lbe_pw_7_transposto,256);
i2=bitxor(a,h_pw_7_transposto,'uint8');


j=bitxor(i,h_pw_7_transposto,'uint8');

results1 = sensitivity( i, i2, 1, 255 );
results2 = sensitivity( a, j, 1, 255 );
percentingSensitive2(1,countermax)=double(results1.diff1_score);
percentingSensitive22(1,countermax)=double(results2.diff1_score);

countermax=countermax+1;

  end
 countermax=1;
  while(countermax<=90000-256*256-1 )
    
lbe_original=lbe64_fmod(countermax:countermax+256*256-1); 
lbe_original_transposto=lbe_original';
h=vec2mat(lbe_original_transposto,256);
i=bitxor(a,h,'uint8');



lbe_pw_7=lbe64_fmod_pow15(countermax:countermax+256*256-1); 
lbe_pw_7_transposto=lbe_pw_7';
h_pw_7_transposto=vec2mat(lbe_pw_7_transposto,256);
i2=bitxor(a,h_pw_7_transposto,'uint8');


j=bitxor(i,h_pw_7_transposto,'uint8');

results1 = sensitivity( i, i2, 1, 255 );
results2 = sensitivity( a, j, 1, 255 );
percentingSensitive3(1,countermax)=double(results1.diff1_score);
percentingSensitive32(1,countermax)=double(results2.diff1_score);

countermax=countermax+1;

  end
  
f1=figure(10);
pos=f1.Position;
pos(3)=pos(3)*1.4;
pos(4)=pos(4)*0.75;
set(gcf,'Position',pos);

plot(movmean(100*percentingSensitive1,300));
hold on 
plot(movmean(100*percentingSensitive2,300));
hold on 
plot(movmean(100*percentingSensitive3,300));
hold on 
axis([0 12000 99.4 99.65])
grid on
legend('$ 56 \cdot 10^{-16}$','$ 56 \cdot 10^{-17}$','$ 56 \cdot 10^{-18}$','Location','SouthEast','Interpreter','latex','Fontsize',18 )
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('$ Diff_{1} \: (\%) $','Interpreter','latex','FontSize', nl)
print('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Journal/figs/resultados/Keysensetivity/64_diff1','-depsc');
print('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Conf/figs/resultados/Keysensetivity/64_diff1','-depsc');



drawnow;




f1=figure(11)
pos=f1.Position;
pos(3)=pos(3)*1.4;
pos(4)=pos(4)*0.75;
set(gcf,'Position',pos);
plot(movmean(100*percentingSensitive12,300));
hold on 
plot(movmean(100*percentingSensitive22,300));
hold on 
plot(movmean(100*percentingSensitive32,300));
hold on 
plot(movmean(100*percentingSensitive42,300));
grid on

axis([0 12000 99.4 99.65])
legend('$56 \cdot 10^{-16}$','$56 \cdot 10^{-17}$','$56 \cdot 10^{-18}$','Location','SouthEast','Interpreter','latex','Fontsize',18 )
set(gca, 'FontName', 'Times New Roman','Fontsize',nm)
xlabel('$tr$','Interpreter','latex','FontSize', nl)
ylabel('$ Diff_2 \: (\%)$ ','Interpreter','latex','FontSize', nl)
print('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Journal/figs/resultados/Keysensetivity/64_diff2','-depsc');
print('../../../../TCASI2021_ImageChaoticCrypthosystem/V_Conf/figs/resultados/Keysensetivity/64_diff2','-depsc');
drawnow;

f64dif1=movmean(100*percentingSensitive1 ,300)
f64dif2=movmean(100*percentingSensitive12 ,300)




m32diff1=mean(f32dif1(9000:20000))
m32diff2=mean(f32dif2(9000:20000))
m64diff1=mean(f64dif1(9000:20000))
m64diff2=mean(f64dif2(9000:20000))

f64dif1=movmean(100*percentingSensitive1 ,300)
f64dif2=movmean(100*percentingSensitive12 ,300)

