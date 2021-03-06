clear;clc;
l1A=[30.15,35.50,37.88,40.25]*1e-2;
l1B=[71.10,65.65,61.30,59.82]*1e-2;
l1=l1B-l1A;
l2A=[0.00,3.45,11.10,19.10]*1e-2;
l2B=[83.01,65.65,61.30,59.82]*1e-2;
l2=l2B-l2A;
aLambda=(2*l1+l2)/2;
f=[75,100,125,150];
vf=f.*aLambda;
rho=[9.53970702815426e-05];
T=0.392;
v=sqrt(T/rho);
deltav=abs(v-vf);
Er=deltav./v*100;   %x%
