%Funktion zum Finden der Eigenfrequenz aus Datei
function a = eigenfrequenz(s);

%Datei öffnen
fid = fopen(s, 'r');
[m, nm] = fscanf(fid, '%f %f %g', [3, Inf]);
fclose(fid);

f = m(2,:)/mean(m(2,:)); %Signal

L = length(f); %Anzahl Abtastwerte
fa = 64; %Abtastfrequenz
T = 1/fa; %Abtastzeit

Nfft = 2^nextpow2(L); %Nächste 2er Potenz
Y = fft(f,Nfft)/L; %Fourier-Transformation

freq = fa/2*linspace(0,1,Nfft/2+1); %Frequenzen
ampl = 2*abs(Y(1:Nfft/2+1)); %Amplitudenverlauf

[val, idx] = max(ampl); %Maximum
a = freq(idx);
end


