function [J_st_mitte, sigma_J_st_mitte] = J_Stab_mitte

L = 0.5
sigma_L = 0.00025
M = 0.162
sigma_M = 0.001			
J_st_mitte = 1/12*M*L^2
sigma_J_st_mitte = sqrt((1/12*L^2*sigma_M)^2+(1/6*M*L*sigma_L)^2)