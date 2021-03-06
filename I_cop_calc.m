%TEC material of Bismuth telluride (Bi2Te3)

%n = 10; 
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
I_cop = alpha/R*(T_h-T_c)/((1+Z*(T_c + T_h)/2)^0.5-1) %current where COP is minimised
I_mp = alpha * T_c/R
COP = zeros(20,1);
Q_C = zeros(20,1);
i = 1;
n=128;
I_n = zeros(20,1);
for I = linspace(0,28,20)
    Q_C(i) = n*(alpha*T_c.*I - 1/2*I.^2.*R - K*(T_c-T_h));
    COP(i) = (alpha*T_c.*I - 1/2*I.^2.*R - K*(T_c-T_h))/(alpha*(T_h-T_c)+I.^2.*R);
    I_n(i) = I;
    i = i+1;
end
yyaxis left
plot(I_n,COP)
ylabel("COP")
xlabel("I")
yyaxis right
plot(I_n,Q_C)
ylabel("Q_c")
legend(["COP","Q_c"])