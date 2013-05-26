function [pos, mw_T, sigma_mw_T] = mw_T_A3(p,sigma_T)

m = load(p) 
pos = m(:,1)				%die Position (Winkel) in welchem der Tisch festgestellt ist

for i=1:length(m(:,1))
  mw_T(i,1) = (m(i,2)+m(i,3)+m(i,4))/30	%Mittelwert nach Standardformel für jede Zeile
endfor

for i=1:length(m(:,1))
  sigma_mw_T(i,1) = sqrt((3*(sigma_T)/30)^2) %der einheitliche Fehler und die einheitliche ableitung lassen sich in
endfor					%Fehlerfortpflanzung direkt zusammenfassen
					