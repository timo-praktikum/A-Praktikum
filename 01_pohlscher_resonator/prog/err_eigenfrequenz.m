%Funktion zum Berechnen des Fehlers der Eigenfrequenz
function a = err_eigenfrequenz(s);

%Datei öffnen
fid = fopen(s, 'r');
[m, nm] = fscanf(fid, '%f %f %g', [3, Inf]);
fclose(fid);

N = length(m(2,:)); %Anzahl Samples
fa = 64; %Abtastrate [Hz]

a = fa/(2*N);
end;
