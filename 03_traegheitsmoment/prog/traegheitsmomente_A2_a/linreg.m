function [b,m,sigma_b,sigma_m] = linreg(p)

[a,x] = getdataA2(p);
y = a(:,1);
sigma_y = a(1,2);

X = [ones(length(x),1) x];

[beta sigma] = ols(y,X);			%f(x)=m*x+b
b = beta(1);
m = beta(2);

Delta = length(x)*(1/sigma_y^2) * sum(x.^2./sigma_y^2) - (sum(x./sigma_y^2))^2;
sigma_m = sqrt(1/Delta * length(x)*(1/sigma_y^2));
sigma_b = sqrt(1/Delta * sum(x.^2./sigma_y^2));

g = [m,b,sigma_m,sigma_b];
save '../../Gnuplot/g.mat' g;

end
