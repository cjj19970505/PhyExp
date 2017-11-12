clear;clc;clf reset;
hold on;
BasicData;
U1 = [0.00, 1.42, 2.81, 4.21, 5.60, 6.99, 8.35, 9.71, 11.04, 12.36, 13.63]; %mV
U2 = [0.00, -1.40, -2.80, -4.21, -5.61, -7.02, -8.43, -9.82, -11.21, -12.57, -13.89];   %mV
U3 = [0.00, -1.37, -2.75, -4.15, -5.53, -6.93, -8.34, -9.73, -11.15, -12.59, -14.07];   %mV
U4 = [0.00, 1.39, 2.77, 4.14, 5.52, 6.88, 8.25, 9.60, 10.99, 12.39, 13.80];     %mV
UH=(abs(U1)+abs(U2)+abs(U3)+abs(U4))/4; %mV
ICH=0:1:10;

fun=inline('a*I','a','I');
a0=0;
a=lsqcurvefit(fun,a0,ICH,UH);
IM=600e-3; %A
KH1=a*sqrt(L^2+D^2)/(u0*n*L*IM);

plotICH=0:1:10;
plot(ICH, UH, '.k', 'markersize', 10);
plot(plotICH,fun(a,ICH),'-k');

legend('原始数据','拟合数据');
xlabel('ICH(工作电流)/mA');
ylabel('UH/mV');
title('图1 霍尔电流与霍尔电势的关系');
grid on;
