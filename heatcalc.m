Tc =-20+273;
e=0.9;
Tair=303;
Tf = (Tc + Tair)/2;
Pr = (278-250)*(0.707-0.720)/50 + 0.720;
g = 9.81;
beta = 1/Tf; % assuming ideal gas
nu = ((278-250)*(15.89-11.44)/50 + 11.44)*10^(-6);
k = ((278-250)*(26.3-22.3)/50 + 22.3)*10^(-3);
sigma=5.67e-8;
L=0.17;
W=0.17;
H=0.04;
%side wall
q_sw=sigma*e*2*H*(L+W)*(Tc^4-Tair^4);
%Top wall
q_tw=2*sigma*e*W*L*(Tc^4-Tair^4);
Ra_sw = Pr*g*beta*(Tair-Tc)*H^3/nu^2;
L_eff = L*W/(2*(L+W));
Ra_tw = Pr*g*beta*(Tair-Tc)*L_eff^3/nu^2;
Ra_bw = Ra_tw;
% Both the Ras are in the range 10^5

N = 3; % No of trays

% Top Wall
Nu_tw = 0.52*Ra_tw^(1/5);
% Bottom wall
Nu_bw = 0.54*Ra_bw^(1/4);
% Using equation 9.30 and 9.32 for cold plate

% Side Wall
Nu_sw = (0.68 + (0.67*(Ra_sw)^(1/4))/(1+(0.492/Pr)^(9/16))^(4/9)); 
% Since Ra is less than 10^9 we use equation 9.27

h_tw = Nu_tw*k/L ;
h_bw = Nu_bw*k/L ;
h_sw = Nu_hw*k/L ;

A_tw = L*W;
A_bw = A_tw;
A_sw = L*H;

delT = Tair - Tc;

Q_tw = A_tw*h_tw*delT
Q_bw = A_bw*h_bw*delT
Q_sw = A_sw*h_sw*delT


alpha = 400*10^(-6);
density = 10^(-5);
L = 2*10^(-3);
A = 4*10^(-6);
k = 2*1.52*10^(-2);
T_c = -20 + 273;
T_h = 37 + 273;
R = density*L/A;
K = k*A/L;
n = 128;
Z = alpha^2/(density*k);
% I_cop = alpha/R*(T_h-T_c)/((1+Z*(T_c + T_h)/2)^0.5-1); %current where COP is minimised
% I_mp = alpha * T_c/R;
Area=0.184;
k=0.01; %styrofoam
l = 0.1; %1cm thick
T_o = 30+273;
const = (k/l)*Area;

Q_ = Q_sw+Q_bw+Q_tw+q_tw+q_sw;

Q = const*(T_o-T_c)+Q_/1440*25;
I=0;
itermax = 100;
iterno = 1;
tol = 10e-5;
I_n = 0;
I_k = 0;
err = 1/0;
while tol < abs(err)
F1 = val(Q,n,I_k,R,K,T_c,T_h,alpha)
F2 = det(I_k,n,R,alpha,T_c)
I_n = I_k - (0.01)*F1/F2;
err = abs(I_n - I_k);
if iterno > itermax
break
end
I_k = I_n;
iterno = iterno + 1;
end
I_n 
iterno
Q 
Q_C = n*(alpha*T_c.*I_n - 1/2*I_n.^2.*R + K*(T_c-T_h))
V
function val=val(Q,n,I,R,K,T_c,T_h,alpha)
val = Q - n*(alpha*T_c.*I - 1/2*I.^2.*R + K*(T_c-T_h));
end
function det = det(I,n,R,alpha,T_c)
det = n*(I*R)/(alpha*T_c) - 1;
end
