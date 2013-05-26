function [J,sigma_J] = J_A2(p, sigma_T)


%Bestimmen des Drehmomentes mittels linearer Regression
[b,m,sigma_b,sigma_m] = linreg('../../data/A2.txt');
D = 1/m;
sigma_D = sqrt((-1/m^2*sigma_m)^2);

%Laden der Mittelwerte
[mw_T, sigma_mw_T] = mw_T_A2(p, sigma_T);

%Traegheitsmoment: J
J = D*((mw_T/(2*pi))^2);

%Fehler des Traegheitsmoments: sigma_J
sigma_J = sqrt(((2*mw_T/(4*pi^2)*D)*sigma_mw_T)^2+(((mw_T/(2*pi))^2)*sigma_D)^2);

end