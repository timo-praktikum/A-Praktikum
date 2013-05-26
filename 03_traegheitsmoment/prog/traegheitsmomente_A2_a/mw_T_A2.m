function [mw_T, sigma_mw_T] = mw_T(p,sigma_T)

m = load(p) ;
Messung = m(:,1);		            %  i-te Zeile entspricht i-ter Messung

mw_T = ((m(1,2)+m(2,2)+m(3,2))/3)/10;	    %  Mittelwert nach Standardformel für jede Zeile

sigma_mw_T = sqrt((3*(sigma_T)/10)^2);           %  der einheitliche Fehler und die einheitliche ableitung lassen sich in der 
                                            %  Fehlerfortpflanzung direkt zusammenfassen
	
end