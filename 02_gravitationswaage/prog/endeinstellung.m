function [b,delta_b] = endeinstellung(s)

fid = fopen(s,'r');
[m,nm] = fscanf(fid,'%u %f',[2,Inf]);
fclose(fid);

sigma_y = 0.0025; %Ablesefehler 0,25 cm

t = m(1,:); %Zeitvektor
y = m(2,:)./100; %Vektor der Messwerte

%plot(t,y);
%delta = input('Delta = ');
delta = 0.01;
[maxtab,mintab] = peakdect(y,delta,t);

%plot(t,y,'-',maxtab(:,1),maxtab(:,2),'+',mintab(:,1),mintab(:,2),'+');
%pause;

%Falsches Maxima bei t=0 entfernen
if (maxtab(1,1)==0)
	maxtab(1,:) = [];
endif

%Maxima und Minima abwechselnd in peak schreiben
peak = [];
for i=1:min(length(maxtab(:,2)),length(mintab(:,2)))
	if (maxtab(i,1)<mintab(i,1))
		peak(end+1) = maxtab(i,2);
		peak(end+1) = mintab(i,2);
	else
		peak(end+1) = mintab(i,2);
		peak(end+1) = maxtab(i,2);
	endif
endfor
if (i<length(maxtab(:,2)))
	peak(end+1) = maxtab(i+1,2);
elseif (i<length(mintab(:,2)))
	peak(end+1) = mintab(i+1,2);
endif

%erwartete Ruhelage aus jeweils 3 Extrema bestimmen
y_bar = [];
for i=1:(length(peak)-2)
	y_bar(end+1) = (peak(i)+peak(i+2)+2*peak(i+1))/4;
endfor

%Einzelfehler von y_bar (Fehlerfortpflanzung)
sigma_y_bar = 1/sqrt(2) * sigma_y;

%Arithmetisches Mittel bilden
b = mean(y_bar);

%Mittlerer quadratischer Fehler
delta_b = sigma_y_bar/sqrt(length(y_bar));

end
