function rho = funRho(n,l)
f=100;  %Hz
T=0.392;    %N
rho=(T*n.^2)./(4*l.^2*f^2);
end

