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
I_mp = alpha * T_c/R;
m = 1;
C_p = 4.2e3;
T = 30+273;
n=128;
i = 1;
time = zeros(20,1);
%time (in min)
for I = linspace(5,28,20)
    time(i) = m*C_p*(T-T_c)/(n*(alpha*T_c.*I - 1/2*I.^2.*R - K*(T_c-T_h)))/60;
    i = i+1;
end
I = linspace(5,28,20);
time_mp = m*C_p*(T-T_c)/(n*(alpha*T_c.*I_mp - 1/2*I_mp.^2.*R - K*(T_c-T_h)))/60;
hold on
plot(I_mp,time_mp,'r*')
plot(I,time)
xlabel("I (in A)")
ylabel("Time (in min)")
legend("I_m_p");
hold off