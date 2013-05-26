function [J_w, sigma_J_w] = J_Wuerfel

a = 0.0975			
sigma_a = 0.00025
b = 0.0785			
sigma_b = 0.00025
A = (2*a+b)/3
sigma_A = 5/9*sigma_a
M = 0.407
sigma_M = 0.001			
J_w = 1/6*M*A^2
sigma_J_w = sqrt((1/6*A^2*sigma_M)^2+(1/3*M*A*sigma_A)^2)