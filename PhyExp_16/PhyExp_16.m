clear;clc;
la=[34.87,34.87,3.45]*1e-2;
lb=[69.93,96.25,96.25]*1e-2;
n=[1,2,3];
l=lb-la;
f=100;  %Hz
T=0.392;    %N
rho=funRho(n,l);
aRho=sum(rho)/length(rho);
