function [J_H,sigma_J_H] = J_Hantel

%Länge:[m]
L = 0.4;	
sigma_L = 0.0005;
%Zylinderdurchmesser:[m]
d = 0.0295;
sigma_d = 0.00025;
r = d/2;
sigma_r = 0.000125;
%Innenabstand_Zylinder:[m]	
s = 0.17;
sigma_s = 0.00025;
%Abstand Zylindermittelpunkt:[m]
a = s-r;
sigma_a = sqrt(sigma_s^2+sigma_r^2);
%Zylindermasse:[kg]
m = 0,0638;
sigma_m = 0.001;
%Masse:[kg]
M_ges = 0.162;
sigma_M_ges = 0.001;
%Masse der Stange:[kg]
M = M_ges - (2*m);
sigma_M = sqrt(sigma_M_ges^2+4*sigma_m^2);

J_H = 1/12*M*L^2+m*(r^2+2*a^2);
sigma_J_H = sqrt((1/12*(L^2)*sigma_M)^2+(1/6*M*L*sigma_L)^2+(2*m*r*sigma_r)^2+(4*m*a*sigma_a)^2);

end
