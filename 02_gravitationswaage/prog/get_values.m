alpha = pi/4;
sigma_alpha = pi/180;
parameter = load('parameter.mat').parameter;

[y1,sigma_y1] = endeinstellung('../data/data1.csv');
[y2,sigma_y2] = endeinstellung('../data/data2.csv');
yi = [y1;y2];
sigma_yi = [sigma_y1;sigma_y2];
[y0,delta_y0] = nulllage(yi,sigma_yi);
[y,delta_y] = mittlere_auslenkung(yi,sigma_yi,y0,delta_y0);
[phi,sigma_phi] = auslenkungswinkel(y,delta_y,parameter.l,parameter.sigma_l);
[x1n,delta_x1n] = nullstellen('../data/data1.csv');
[x2n,delta_x2n] = nullstellen('../data/data2.csv');
[T1,delta_T1] = periodendauer(x1n,delta_x1n);
[T2,delta_T2] = periodendauer(x2n,delta_x2n);
Ti = [T1,T2];delta_Ti = [delta_T1,delta_T2];
[T,delta_T] = gewichtetes_mittel(Ti,delta_Ti);
[gamma,delta_gamma] = gravitationskonstante(phi,sigma_phi,parameter.a,parameter.sigma_a,parameter.b,parameter.sigma_b,alpha,sigma_alpha,parameter.r,parameter.sigma_r,parameter.M,parameter.sigma_M,T,delta_T);
