%eigenfreq = eigenfrequenz('../data_edited/d0_f0.txt');

%dateien.txt einlesen
fname='../data_edited/dateien.txt';
fid = fopen(fname);
n=0;
while (!feof(fid))
	n++;
	dateinamen{end + 1}=fgetl(fid); %enthält Dateinamen
endwhile
fclose(fid);

%Frequenzen extrahieren
frequenzen = regexprep(dateinamen,'^d..f', ''); %enthält Frequenzen
frequenzen = strrep(frequenzen,'.txt','');
frequenzen = str2double(frequenzen)/1000;

%Dämpfungen extrahieren
daempfungen = strrep(dateinamen,'d',''); %enthält Dämpfungen
daempfungen = regexprep(daempfungen,'_.*','');
daempfungen = str2double(daempfungen);

%Auf die Dämpfungen aufteilen
for i = 1:length(daempfungen);
	switch (daempfungen(i))
	case 4
		d4_dateinamen{end + 1} = dateinamen{i};
		d4_frequenzen(end + 1) = frequenzen(i);
	case 6
		d6_dateinamen{end + 1} = dateinamen{i};
		d6_frequenzen(end + 1) = frequenzen(i);
	case 8
		d8_dateinamen{end + 1} = dateinamen{i};
		d8_frequenzen(end + 1) = frequenzen(i);
	endswitch
endfor

%Eigenfrequenzen berechnen
d4_eigenfrequenz = eigenfrequenz('../data_edited/d4_f0.txt');
d6_eigenfrequenz = eigenfrequenz('../data_edited/d6_f0.txt');
d8_eigenfrequenz = eigenfrequenz('../data_edited/d8_f0.txt');

%Mittelt die Amplitude einer Schwingung
function z = amplitude(s);
for i = 1:length(s);
	fid = fopen(s{i},'r');
	[m,nm] = fscanf(fid,'%f %f %d',[3,Inf]);
	fclose(fid);
	t = m(1,:) - m(1,1); %Messzeiten
	y = m(2,:) - mean(m(2,:)); %Messwerte

	%Delta schätzen
	delta = (max(y)+abs(min(y)))*0.95;

	[maxtab,mintab] = peakdect(y,delta,t); %Stelle, Wert
	plot(t',y',maxtab(:,1),maxtab(:,2),'+',mintab(:,1),mintab(:,2),'+');
	#pause;
	
	z(end + 1) = (mean(maxtab(:,2))+mean(abs(mintab(:,2))))/2;
endfor
end

%Für jede Dämpfung Amplitude berechnen
d4_amplitude = amplitude(strrep(d4_dateinamen,'d','../data_edited/d'));
d6_amplitude = amplitude(strrep(d6_dateinamen,'d','../data_edited/d'));
d8_amplitude = amplitude(strrep(d8_dateinamen,'d','../data_edited/d'));

eigen_unged = 0.3312314117440133;

plot(d4_frequenzen/eigen_unged,d4_amplitude/d4_amplitude(1),d6_frequenzen/eigen_unged,d6_amplitude/d6_amplitude(1),d8_frequenzen/eigen_unged,d8_amplitude/d8_amplitude(1),[1,1],[0,10]);
