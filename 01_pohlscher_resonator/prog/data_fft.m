clear all; close all; clc

fid = fopen('d0_f0.txt', 'r');
[m, nm] = fscanf(fid, '%f %f %g', [3, Inf]);
fclose(fid);

%Signal f:
f = m(2,:)/mean(m(2,:));

nf = 64; %Abtastrate 64Hz
ds = 1/nf; %Abtastintervall [s]


dt = ds/60; %Abtastintervall [min]
dh = 60/dt; %Stundenteiler


y = fft(f); %Frequenzspektrum der Messwerte
plot(abs(y))

n = length(f);
amplitude = abs(y(1:floor(n/2))).^2;
nyquist = 1/2; %Abtasttheorem
freq = (1:n/2)/(n/2)*nyquist*nf;
circlefreq = 2*pi*freq;

%Maximum
[val, idx] = max(amplitude);
peak = num2str (freq(idx));

plot(freq,amplitude,'LineWidth',2);
    grid on
    %xlim([1 1000])
    xlabel('Frequenz [Hz]')
    title('Frequenzspektrum')
    %set(gcf,'PaperPositionMode','Auto','Position',[100 100 1280 720])
    %set(gca,'XTick',[1:10,20:10:80,100:100:500,1000])
    %text(freq(idx),val,peak,'right','FontSize',18)
    %text(24,3e14,'24h \rightarrow','HorizontalAlignment','right','FontSize',18)
    %text(84,0.5e14,'84h 15min \rightarrow','HorizontalAlignment','right','FontSize',18)
    %text(168,2.5e14,'168h 30min \rightarrow','HorizontalAlignment','right','FontSize',18)
    print('-dpng','-r300','FFT.png')
