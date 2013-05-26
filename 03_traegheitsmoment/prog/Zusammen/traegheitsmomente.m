function [J,sigma_J] = traegheitsmomente(p, sigma_T, sigma_pos)


%a               = 0.566962         +/- 0.08893      (15.69%)     
%die Steigung a der ausgleichsgeraden entspricht der Winkelrichtgröße D 
							
D = 0.01
sigma_D = 0.0

[pos, mw_T, sigma_mw_T] = MW_T(p, sigma_T, sigma_pos)    			%m = pos   mw_T    sigma_mw_T
for i=1:length(pos)								%Traegheitsmoment: J
  J(i,1) = D*((mw_T(i,1)/(2*pi))^2);
endfor
for i=1:length(pos);								%Fehler des Traegheitsmoments: sigma_J
  sigma_J(i,1) = sqrt(((2*mw_T(i,1)/(4*pi^2)*D)*sigma_mw_T(i,1))^2+((((mw_T(i,1))/2*pi)^2)*sigma_D)^2);
endfor;