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
q_sw=sigma*e*2*H1*(L+W)*(Tc^4-Tair^4);
%Top wall
q_tw=sigma*e*W*L*(Tc^4-Tair^4);
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
