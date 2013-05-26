function [J_hz, sigma_J_hz] = J_Hohlzylinder



D = 0.099
sigma_D = 0.00025
d = 0.0855
sigma_d = 0.00025
M = 0.256
sigma_M = 0.001
R = D/2
sigma_R = 0.000125
r = d/2
sigma_r = 0.000125
M = 0.407
sigma_M = 0.001			
J_hz = 1/2*M*(R^2+r^2)
sigma_J_hz = sqrt((1/2*(R^2+r^2)*sigma_M)^2+(M*R*sigma_R)^2+(M*r*sigma_r)^2)