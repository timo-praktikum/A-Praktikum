function [J_k, sigma_J_k] = J_Kugel

U = 0.32;		
sigma_U = 0.0005;
R = U/(2*pi);
sigma_R = 1/(2*pi)*sigma_U;
M = 0.477;
sigma_M = 0.001;		

J_k = (2/5)*M*R^2;
sigma_J_k = sqrt((2/5*R^2*sigma_M)^2+(4/5*M*R*sigma_R)^2);

end