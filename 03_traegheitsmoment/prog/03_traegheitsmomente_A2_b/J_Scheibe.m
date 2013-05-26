function [J_s, sigma_J_s] = J_Scheibe

d = 0.1630;
sigma_d = 0.00025;
R = d/2;
sigma_R = 0.000125;
M = 0.407;
sigma_M = 0.001;			

J_s = M*R^2;
sigma_J_s = sqrt((R^2*sigma_M)^2+(2*M*R*sigma_R)^2);

end
