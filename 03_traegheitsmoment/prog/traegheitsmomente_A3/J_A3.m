function [J,sigma_J] = J_A3(p, sigma_T)

[b,m,sigma_b,sigma_m] = linreg('A2.txt');
							
D = 1/m;
sigma_D = sqrt((-1/m^2*sigma_m)^2);

[pos, mw_T, sigma_mw_T] = MW_T(p, sigma_T, sigma_pos);    			%m = pos   mw_T    sigma_mw_T
for i=1:length(pos)								%Traegheitsmoment: J
  J(i,1) = D*((mw_T(i,1)/(2*pi))^2);
endfor
for i=1:length(pos);								%Fehler des Traegheitsmoments: sigma_J
  sigma_J(i,1) = sqrt(((2*mw_T(i,1)/(4*pi^2)*D)*sigma_mw_T(i,1))^2+((((mw_T(i,1))/(2*pi))^2)*sigma_D)^2);
endfor;