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
m = pow(h*(2*w+2*b)/(k*w*b),0.5)
M = del_T*pow(h*(2*w+2*b)*(k*w*b),0.5)
q = M*(np.sinh(m*L)+(h/(m*k))*np.cosh(m*L))/(np.cosh(m*L)+(h/(m*k))*np.sinh(m*L))

for i in range(100):
    copn.append((i+1)*q)
    x.append(i+1)


plt.plot(copn,x)
plt.show()

