close all
avgmean=100;
figure(1)
plot(movmean(100*percentingSensitive1,300));
hold on 
plot(movmean(100*percentingSensitive2,300));
hold on 
plot(movmean(100*percentingSensitive3,300));
hold on 
plot(movmean(100*percentingSensitive4,300));
axis([0 6000 99.3 99.7])
legend('8.9x10^{-6}','8.9x10^{-7}','8.9x10^{-8}','8.9x10^{-9}','Location','SouthEast','Fontsize',18 )
set(gca, 'FontName', 'Times New Roman','Fontsize',14)
xlabel('$T_s $','Interpreter','latex','FontSize', 24)
ylabel('$Diff \: \%$','Interpreter','latex','FontSize', 24)
print('32_diff1','-depsc');
drawnow

figure(2)
plot(movmean(100*percentingSensitive12,300));
hold on 
plot(movmean(100*percentingSensitive22,300));
hold on 
plot(movmean(100*percentingSensitive32,300));
hold on 
plot(movmean(100*percentingSensitive42,300));
axis([0 6000 99.3 99.7])
legend('8.9x10^{-6}','8.9x10^{-7}','8.9x10^{-8}','8.9x10^{-9}','Location','SouthEast','Fontsize',18 )
set(gca, 'FontName', 'Times New Roman','Fontsize',14)
xlabel('$T_s $','Interpreter','latex','FontSize', 24)
ylabel('$Diff \: \%$','Interpreter','latex','FontSize', 24)
print('32_diff2','-depsc');

drawnow;


  
figure(3)
plot(movmean(100*percentingSensitive1,300));
hold on 
plot(movmean(100*percentingSensitive2,300));
hold on 
plot(movmean(100*percentingSensitive3,300));
hold on 
plot(movmean(100*percentingSensitive4,300));


axis([0 6000 99.3 99.7])
legend('8.9x10^{-15}','8.9x10^{-16}','8.9x10^{-17}','8.9x10^{-18}','Location','SouthEast','Fontsize',18 )
set(gca, 'FontName', 'Times New Roman','Fontsize',14)
xlabel('$T_s $','Interpreter','latex','FontSize', 24)
ylabel('$Diff_1 \: \%$','Interpreter','latex','FontSize', 24)
print('64_diff1','-depsc');
drawnow;


figure(4)
plot(movmean(100*percentingSensitive12,300));
hold on 
plot(movmean(100*percentingSensitive22,300));
hold on 
plot(movmean(100*percentingSensitive32,300));
hold on 
plot(movmean(100*percentingSensitive42,300));

axis([0 6000 99.3 99.7])
legend('8.9x10^{-15}','8.9x10^{-16}','8.9x10^{-17}','8.9x10^{-18}','Location','SouthEast','Fontsize',18 )
set(gca, 'FontName', 'Times New Roman','Fontsize',14)
xlabel('$T_s $','Interpreter','latex','FontSize', 24)
ylabel('$Diff_2 \: \%$','Interpreter','latex','FontSize', 24)
print('64_diff2','-depsc');
drawnow;


