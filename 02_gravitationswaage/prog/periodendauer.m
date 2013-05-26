function [T,delta_T] = periodendauer(xn,delta_xn)

a = [];
for i=1:length(xn)-2
	a(end+1) = xn(i+2)-xn(i); %Einzelwerte Periodendauer
endfor

sigma_a = sqrt(2) * delta_xn(1); %Fehlerfortpflanzung

T = mean(a); %Mittelwert

delta_T = sigma_a/sqrt(length(xn));

end
