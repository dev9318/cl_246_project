alpha = 400*10^(-6);
density = 10^(-5);
L = 2*10^(-3);
A = 4*10^(-6);
k = 2*1.52*10^(-2);
T_c = 15 + 273;
T_h = 40 + 273;
R = density*L/A;
K = k*A/L;
Z = alpha^2/(density*k);
I = alpha * T_c/R; %I for max power (Q_c)
m = 1;
C_p = 4.2e3;
T = 30+273;
n=128;
%time (in min)
time = m*C_p*(T-T_c)/(n*(alpha*T_c.*I - 1/2*I.^2.*R - K*(T_c-T_h)))/60