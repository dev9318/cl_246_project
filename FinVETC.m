format long
del_T = 50;
copn = zeros(100,1);
x = 1:1:10;
w = 4.0*power(10,-3); b = 2.0*power(10,-3); L = 17.0*power(10,-3);
k = 20;
h = 100;
m = power(h*(2*w+2*b)/(k*w*b),0.5);
M = del_T*power(h*(2*w+2*b)*(k*w*b),0.5);
q = M*(sinh(m*L)+(h/(m*k))*cosh(m*L))/(cosh(m*L)+(h/(m*k))*sinh(m*L));

%W = [i*pow(10,-3) for i in range(1,11)]

%for i = 1:10
%    w = W(i);
%    m = pow(h*(2*w+2*b)/(k*w*b),0.5);
%    M = del_T*pow(h*(2*w+2*b)*(k*w*b),0.5);
%    q = M*(sinh(m*L)+(h/(m*k))*cosh(m*L))/(cosh(m*L)+(h/(m*k))*sinh(m*L));
%    copn(i) = q;

%end
%plt.plot(copn,x)
%plt.show()


I = 1:1000;
 for i = 1:1000
     copn(i) = q*i + h*del_T*(16*power(10,-4)-w*b*i);
 end
copn
plot(copn,I)
% plt.plot(copn,x)
% plt.show()