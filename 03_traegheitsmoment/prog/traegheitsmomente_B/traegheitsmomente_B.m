function [Jb, sigma_Jb] = traegheitsmenete_B(p,m)

r = 0.06				
sigma_r = 0.001
R = 0.213				
sigma_R = 0.001
%g = Erdbeschl. nach http://www.ptb.de/cartoweb3/SISproject.php
g = 9.811600
sigma_g = 0.000020 
a =
sigma_a =

Jb = r*R*m*g/a-m*r^2

sigma_Jb = sqrt(((R*m*g/a-2*m*r)*sigma_r)^2+(r*m*g/a*sigma_R)^2+(r*R*m/a)^2+(-r*R*m*g/a^2)^2)