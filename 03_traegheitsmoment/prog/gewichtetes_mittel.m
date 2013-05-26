function [z,sigma_z] = gewichtetes_mittel(a,delta_a)
pkg load nan;
z = mean(a,[],'A',(1./(delta_a.^2)));
sigma_z = sqrt(1/sum(1./(delta_a.^2)));

end
