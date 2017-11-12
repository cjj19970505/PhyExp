clear;clc;
d=[64.255,69.125,74.015,78.892,83.769,88.682,93.553,98.349,103.324,108.158]; %mm
delta5d=[];
for i=1:5
    delta5d=[delta5d,d(i+5)-d(i)];
end
lambda=sum(delta5d)*(1/5)/(5/2);    %mm
f0=35.569; %kHz
v=f0*lambda;    %
l=[54.147,58.984,63.793,68.562,73.365,78.169,82.975,87.680,92.531,97.320];
delta5l=[];
for i=1:5
    delta5l=[delta5l,l(i+5)-l(i)];
end
lambda2=sum(delta5l)*(1/5)/(5/2);
f02=35.578;
v2=f02*lambda2;
%================================
L=[70,80,90,100,110,120,130,140,150,160,170]*1e-3;
t=[295,324,353,382,411,440,465,497,526,556,584]*1e-6;
delta5v=[];
for i=1:5
    delta5v=[delta5v,(L(i+5)-L(i))/(t(i+5)-t(i))];
end
v3=sum(delta5v)/5;

