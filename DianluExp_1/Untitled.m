clear;clc;
U=[0.448,1.054,1.283,1.647];    %V
I=[40.8,33.5,30.8,26.5]; %mA
uifun=inline('x(1)*i+x(2)','x','i');
c0=[0,0];
c_uifun=lsqcurvefit(uifun,c0,I,U);

%===绘图===
clf reset;
hold on;
plot(I,U,'.k','markersize',16);
plotI=25:0.1:45;
plot(plotI,uifun(c_uifun,plotI),'-k');
xlabel('I(mA)');
ylabel('U(V)');
legend('原始数据','拟合曲线');
grid on;
