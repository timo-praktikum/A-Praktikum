%Funktion zum Berechnen des logarithmischen Dekrements
function a = logdek(s);

fid = fopen(s,'r');
[m,nm] = fscanf(fid,'%f %f %d',[3,Inf]);
fclose(fid);

t = m(1,:)'-m(1,1);
y = m(2,:)'-mean(m(2,:));

plot(t,y);
delta = input('Delta=');
[maxtab,mintab] = peakdect(y,delta,t);

plot(t,y,maxtab(:,1),maxtab(:,2),'+');
pause;

for i=1:(length(maxtab(:,2))-1)
	logd(end + 1) = log(maxtab(i,2)/maxtab(i+1,2));
endfor
logd
a = mean(logd);

end
