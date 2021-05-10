alpha = 400*10^(-6);
density = 10^(-5);
L = 2*10^(-3);
A = 4*10^(-6);
k = 2*1.52*10^(-2);
T_c = -20 + 273;
T_h = 50 + 273;
R = density*L/A;
K = k*A/L;
Z = alpha^2/(density*k);
I = alpha * T_c/R;
m = 1;
C_p = 4.2e3;
n=128;
q = n*(alpha*T_c.*I - 1/2*I.^2.*R - K*(T_c-T_h))
%dimensions
L=60e-03; %6 cm
W=6e-03; %6 mm
H=12e-03; %12 mm
N=50;
% Total H = 6 cm; Total W = 6 cm (10*6)
%liquid
Tin=273+30;
mdot=2.1e-5;
Cp=4200;
kliq=0.634;

Pr=4;
rho = 1/1.009*10^3;
mu = (631e-6)/rho;

%chip
Ts=50+273;
kchip=220;

D=4*H*W/(2*(H+W));
Re=mdot*D/(mu*H*W)

Gz=Re*Pr*D/L
delTi = Ts - Tin;
Ph=2*H + W;
%Approximation 01
Nu1=4.44;
h1=Nu1*kliq/D;
%qtot1=N*mdot*Cp*(delTi - delTo1)
for i = 1:100
    mdot = q/(N*Cp*(delTi - delTi*exp((-Ph*L*h1)/(mdot*Cp))));
end
Velocity = mdot * rho /(N * W * H)
delTo1 = delTi*exp((-Ph*L*h1)/(mdot*Cp));
Tout1 = Ts - delTo1
