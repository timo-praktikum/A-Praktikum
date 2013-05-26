function [alpha,sigma_alpha] = winkelbeschleunigung(s)

r = 0.213;
sigma_r = 0.001;
sigma_s = 0.002;
data = load(s);
t = data(:,1);
s = data(:,2);

[bier,temp_a,sigma_temp_a] = linreg(t,sqrt(s),sigma_s);
a = 2*temp_a^2;
sigma_a = sqrt(8)*temp_a*sigma_temp_a;
alpha = a/r;
sigma_alpha = sqrt(sigma_a^2/r^2+sigma_r^2*a^2/r^4);

end
