function [pos, mw_T, sigma_mw_T] = MW_T(p,sigma_T,sigma_pos)

m = load(p) 
pos = m(:,1)				%die Position (Winkel) in welchem der Tisch festgestellt ist

for i=1:length(m(:,1))
  mw_T(i,1) = (m(i,2)+m(i,3)+m(i,4))/3	%Mittelwert nach Standardformel für jede Zeile
endfor

for i=1:length(m(:,1))
  sigma_mw_T(i,1) = sqrt((sigma_T^2)/3) %der einheitliche Fehler und die einheitliche ableitung lassen sich in
endfor					%Fehlerfortpflanzung direkt zusammenfassen
					