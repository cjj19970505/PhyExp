clear;clc;clf reset;
hold on;
T=[61.3,51.5,62.6,50.6,64.5,64.9];
aT = sum(T)/length(T);
e=[1623,1551,1506,1463,1420,1383,1333,1290,1238,1173,1101,1009,882,681,405,173,40,26,15,13,12];
T=[38.8,39.6,40.0,41.0,42.0,43.0,44.2,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0,56.0,57.1,58.0,59.1,60.1];
xb=40:0.01:60;
yb=spline(T,e,xb);
plot(T,e,'k.','markersize',16);
plot(xb,yb,'k-','markersize',10);
xlabel('T/℃');
ylabel('ε/mV');
Xs=xb;
Ys=yb;
maxIndex=0;
maxK=0;
for i=6:length(Xs)-1
    k=(Ys(i+1)-Ys(i))/(Xs(i+1)-Xs(i));
    if(maxK < abs(k))
        maxK=abs(k);
        maxIndex=i;
    end   
end
kF = inline('(y(2)-y(1))/(x(2)-x(1))*(X-x(1))+y(1)','x','y','X');
invKF = inline('(x(2)-x(1))/(y(2)-y(1))*(Y-y(1))+x(1)','x','y','Y');
kX=[50,55];
kF([Xs(maxIndex),Xs(maxIndex+1)], [Ys(maxIndex),Ys(maxIndex+1)], kX);
plot(kX,kF([Xs(maxIndex),Xs(maxIndex+1)], [Ys(maxIndex),Ys(maxIndex+1)], kX),'k-');
zeroX = invKF([Xs(maxIndex),Xs(maxIndex+1)], [Ys(maxIndex),Ys(maxIndex+1)], 0);
plot(zeroX,0,'k.','markersize',24);
axis([35, 65, 0, 1700]);
title('感应电动势积分值ε及其对应的温度T值曲线');
grid on;

