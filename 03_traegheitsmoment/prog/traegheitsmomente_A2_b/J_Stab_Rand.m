function [J_st_rand, sigma_J_st_rand] = J_Stab_Rand

L = 0.5
sigma_L = 0.00025
M = 0.162
sigma_M = 0.001			
J_st_rand = 1/3*M*L^2
sigma_J_st_rand = sqrt((1/3*L^2*sigma_M)^2+(2/3*M*L*sigma_L)^2)