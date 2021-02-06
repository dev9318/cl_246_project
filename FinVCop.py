import matplotlib.pyplot as plt
import numpy as np

const1 = 38
const2 = 38 - 3*2

del_T = 20
copn = []
x = []
w, b, L = 4.0*pow(10,-3), 1.0*pow(10,-3), 17.0*pow(10,-3)
k = 230
h = 100
# m = pow(h*(2*w+2*b)/(k*w*b),0.5)
# M = del_T*pow(h*(2*w+2*b)*(k*w*b),0.5)
# q = M*(np.sinh(m*L)+(h/(m*k))*np.cosh(m*L))/(np.cosh(m*L)+(h/(m*k))*np.sinh(m*L))

W = [i*pow(10,-3) for i in range(1,11)]

for (w, i) in zip(W,[i for i in range(10)]):
    m = pow(h*(2*w+2*b)/(k*w*b),0.5)
    M = del_T*pow(h*(2*w+2*b)*(k*w*b),0.5)
    q = M*(np.sinh(m*L)+(h/(m*k))*np.cosh(m*L))/(np.cosh(m*L)+(h/(m*k))*np.sinh(m*L))
    copn.append((const2+q*10)/const1)
    x.append(i+1)


plt.plot(copn,x)
plt.show()



# for i in range(100):
#     copn.append((const2+q*i)/const1)
#     x.append(i+1)


# plt.plot(copn,x)
# plt.show()

