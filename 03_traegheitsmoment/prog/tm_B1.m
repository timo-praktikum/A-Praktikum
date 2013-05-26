function [Theta,sigma_Theta] = tm_B1(r,sigma_r,R,sigma_R,m,sigma_m,g,sigma_g,alpha,sigma_alpha)
#r:Radius Rad Bindfaden
#R:Radius Felge
#m:Vektor der beschleunigenden Massen m=[0.1;0.2;0.5;1.0]
#g:Erdbeschleunigung
#alpha:Vektor der Winkelbeschleunigungen

dr = ((R*g).*m)./alpha .- (2*r).*m;
dR = ((r*g).*m)./alpha;
dm = (r*R*g)./alpha .- r^2;
dg = ((r*R).*m)./alpha;
dalpha = -((r*R*g).*m)./alpha.^2;

Theta_vec = ((r*R*g).*m)./alpha .- m.*r^2;
sigma_Theta_vec = sqrt(sigma_r^2.*dr.^2 + sigma_R^2.*dR.^2 + sigma_m.^2.*dm.^2 + sigma_g^2.*dg.^2 + sigma_alpha.^2.*dalpha.^2);

[Theta,sigma_Theta] = gewichtetes_mittel(Theta_vec,sigma_Theta_vec);

end
