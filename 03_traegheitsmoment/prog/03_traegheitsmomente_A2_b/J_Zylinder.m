function [J_z, sigma_J_z] = J_Zylinder

d = 0.078;
sigma_d = 0.00025;
R = d/2;
sigma_R = 0.000125;
M = 0.198;
sigma_M = 0.001;

J_z = M*R^2;
sigma_J_z = sqrt((R^2*sigma_M)^2+(2*M*R*sigma_R)^2);

end
