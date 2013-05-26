function [Theta,sigma_Theta] = tm_B2(T,sigma_T,g,sigma_g,z,sigma_z,m,sigma_m)
#T:Schwingungsdauer
#g:Erdbeschleunigung
#z:Abstand des Zusatzgewichts von der Drehachse
#m:Masse Zusatzgewicht

dT = T*g*z*m/(2*pi);
dg = T^2*z*m/(4*pi);
dz = T^2*g*m/(4*pi) - 2*m*z;
dm = T^2*g*z/(4*pi) - z^2;

Theta = T^2*g*z*m/(4*pi^2) - m*z^2;
sigma_Theta = sqrt(sigma_T^2*dT^2 + sigma_g^2*dg^2 + sigma_z^2*dz^2 + sigma_m^2*dm^2);

end
