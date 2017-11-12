clear;clc;clf reset;
hold on;
BasicData;
U1 = [1.78, 3.12, 4.28, 5.69, 6.95, 8.30, 9.66, 11.03, 12.44, 13.80];
U2 = [-1.86, -3.21, -4.47, -5.76, -7.02, -8.38, -9.74, -11.11, -12.51, -13.89];
U3 = [-1.84, -3.10, -4.36, -5.67, -7.00, -8.35, -9.72, -11.09, -12.47, -13.86];
U4 = [1.76, 3.02, 4.28, 5.60, 6.93, 8.28, 9.63, 11.01, 12.39, 13.77];
UH=(abs(U1)+abs(U2)+abs(U3)+abs(U4))/4; %mV
IM=100:100:1000;  %mA

fun=inline('a*I','a','I');
a0=0;
a=lsqcurvefit(fun,a0,IM,UH);
ICH=6e-3; %A
KH2=a*sqrt(L^2+D^2)/(u0*n*L*ICH);

plotIM=0:100:1000;

plot(IM, UH, '.k', 'markersize', 10);
plot(plotIM,fun(a,plotIM),'-k');
grid on;

legend('原始数据','拟合数据');
xlabel('IM(励磁电流)/mA');
ylabel('UH/mV');
title('图2 励磁电流与霍尔电势的关系');
grid on;