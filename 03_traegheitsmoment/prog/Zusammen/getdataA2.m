function [D,Wr,Wl] = getdataA2(p)

%d = Durchmesser
d = 0.1630 %m 	
sigma_d = 0.00025
%phi = Auslenkungswinel
%sigma_phi = 5 Grad
%g = Erdbeschl. nach http://www.ptb.de/cartoweb3/SISproject.php
g = 9.811600 %m/s2	
sigma_g = 0.000020 %m/s2

%fid = fopen(s,'r')
%[m,nm] = fscanf(fid,'%u %u %u',[3,Inf]);
%fclose(fid);

m = load(p)

M = m(:,1);			%Die Massen stehen in der ersten Spalte
for i=1:length(m(:,2));
  Wr(i,1) = (m(i,2).-310);   %Die Auslenkungswinkel zur rechten Seite, Nulllage abgezogen und im Betrag
endfor;
for i=1:length(m(:,3));		%Anlog zur rechten Seite	
  Wl(i,1) = abs((m(i,3).-310));
endfor;

for i=1:length(Wr)		%Fehler der Winkel 
sigma_Wr(i,1) = 5
sigma_wl(i,1) = 5
endfor

F = M.*g;			%Berechnung der wirkenden Kraft
for i=1:length(M)
  sigma_F(i,1) = M(i)*sigma_g
endfor  
D = F*(d/2);			%Berechnung der Winkelrichtgröße D
for i=1:length(D)
  sigma_D(i,1) = sqrt(d^2/4*sigma_F(i,1)^2+(F(i,1)/2*sigma_d)^2)

WrD = [D,Wr,sigma_D,sigma_Wr];			%Erstellen einer Matrix die Auslenkung und Winkelrichtgröße als Spaltenvektoren hat 
WlD = [D,Wl,sigma_D,sigma_Wl];

W = [Wr,sigma_Wr;Wl,sigma_Wl];			%Zusammenfügen der Matrizen WrD und WlD die lineare Regression
DX2 = [D;D]
WD = [DX2,W]


save 'WrD.mat' WrD;		%Speichern der Daten für Gnuplot
save 'WlD.mat' WlD;
save 'WD.mat' WD;

end