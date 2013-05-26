function [z,delta_z] = mittlere_auslenkung(y,sigma_y,y_0,delta_y_0)

%Einzelwerte
a = abs(y.-y_0);
sigma_a = sqrt(sigma_y.^2 .+ delta_y_0.^2);

%Gewichteter Mittelwert
[z,delta_z] = gewichtetes_mittel(a,sigma_a);

end
