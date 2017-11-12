clear;clc;
t0=[18.72,10.97,7.37];  %常温下（25.5℃）
t1=[13.78,7.91,5.37];   %30.0℃
t2=[9.37,5.69,3.97];    %34.9℃
t3=[6.75,4.13,2.91];    %39.9℃
t4=[5.09,3.06,2.10];    %44.7℃
eta0=eta(t0);
eta1=eta(t1);
eta2=eta(t2);
eta3=eta(t3);
eta4=eta(t4);
aEta=[sum(eta0)/length(eta0),sum(eta1)/length(eta1),sum(eta2)/length(eta2),sum(eta3)/length(eta3),sum(eta4)/length(eta4)];
%---绘图---
clf reset;
hold on;
grid on;
xlabel('温度(℃)');
ylabel('粘滞系数η(Pa*s)')
T=[25.5,30.0,34.9,39.9,44.7];
plot(T,aEta,'.k','markersize',20);
eta_T_fun=inline('x(1)*exp(x(2)*T)+x(3)','x','T');
x0=[0,0,0];
%eta_T_fun=inline('x(1)*T+x(2)','x','T');
%x0=[0,0];
coefficient=lsqcurvefit(eta_T_fun,x0,T,aEta);
plotT=25:0.1:45;
title('温度和粘滞系数关系（线性拟合）');
plot(plotT,eta_T_fun(coefficient,plotT),'-k');
legend('原始数据','拟合曲线');
%legend('拟合曲线');