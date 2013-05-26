function [phi,sigma_phi] = auslenkungswinkel(y,sigma_y,l,sigma_l)

phi = 0.5 * atan(y/l);
sigma_phi = 1/(2*(y^2+l^2)) * sqrt(sigma_y^2*l^2 + sigma_l^2*y^2);

end
