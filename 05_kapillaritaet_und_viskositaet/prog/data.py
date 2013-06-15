from numpy import loadtxt, sqrt, pi, mean, log, linspace, array
import matplotlib.pyplot as plt
from linreg import linreg

g = 9.81

#Aufgabe 1
d_Kapillare = (loadtxt('../data/durchmesser_messung'))*10**(-3)
sigma_d_Kapillare = 0.01e-3
d_gruen = mean((d_Kapillare[0:3])[:,0]-(d_Kapillare[0:3])[:,1])
d_blau = mean((d_Kapillare[3:6])[:,0]-(d_Kapillare[3:6])[:,1])
d_rot = mean((d_Kapillare[6:9])[:,0]-(d_Kapillare[6:9])[:,1])
sigma_d = sigma_d_Kapillare/sqrt(3)


#gruen - blau - rot
h_Fluid = (loadtxt('../data/steighoehen_messung'))*10**(-3)
sigma_h_Fluid = 0.5e-3
h_dest = array([mean((h_Fluid[0:3])[:,0]),mean((h_Fluid[0:3])[:,1]),mean((h_Fluid[0:3])[:,2])])
h_methol = array([mean((h_Fluid[3:6])[:,0]),mean((h_Fluid[3:6])[:,1]),mean((h_Fluid[3:6])[:,2])])
h_glykol = array([mean((h_Fluid[6:9])[:,0]),mean((h_Fluid[6:9])[:,1]),mean((h_Fluid[6:9])[:,2])])

#Dichten
p_dest = 1
p_methol = 0.826
p_glykol = 1.003

#Oberflächenspannung dest. Wasser
_sigma_dest_gruen = h_dest[0]*d_gruen*g*p_dest/4
_sigma_dest_blau = h_dest[1]*d_blau*g*p_dest/4
_sigma_dest_rot = h_dest[2]*d_rot*g*p_dest/4
_sigma_dest = array([_sigma_dest_gruen,_sigma_dest_blau,_sigma_dest_rot])

#Oberflächenspannung Methol-Alkohol
_sigma_methol_gruen = h_methol[0]*d_gruen*g*p_methol/4
_sigma_methol_blau = h_methol[1]*d_blau*g*p_methol/4
_sigma_methol_rot = h_methol[2]*d_rot*g*p_methol/4
_sigma_methol = array([_sigma_methol_gruen,_sigma_methol_blau,_sigma_methol_rot])

#Oberflächenspannung Aethylenglykol
_sigma_glykol_gruen = h_glykol[0]*d_gruen*g*p_glykol/4
_sigma_glykol_blau = h_glykol[1]*d_blau*g*p_glykol/4
_sigma_glykol_rot = h_glykol[2]*d_rot*g*p_glykol/4
_sigma_glykol = array([_sigma_glykol_gruen,_sigma_glykol_blau,_sigma_glykol_rot])

#Aufgabe 2b
def a2b():
	auslauf_messung = loadtxt('../data/auslauf_2b')
	h = auslauf_messung[:,0]
	t = auslauf_messung[:,1]
	sigma_h_Messung = 1
	sigma_h_log = sqrt(sigma_h_Messung**2*(1/h)**2)
	fig1 = plt.figure(1)
	plt.xlabel(r'$t$')
	plt.ylabel(r'$\log{(h)}$')
	plt.grid()
	x = linspace(0,1400)
	plt.errorbar(t,log(h),sigma_h_log, fmt='ko', label="Messung")

	h_list=[];t_list=[]	
	for i in log(h):
		h_list.append(i)
	for i in t:
		t_list.append(i)
	[b,m,sigma_b,sigma_m]=linreg(t_list,h_list,sigma_h_log)
	print([m, sigma_m])
	plt.plot(x,m*x+b)
	plt.legend(numpoints=1,loc='upper right')
	plt.savefig('../pdfs/Plot_Aufg2b.pdf')
	plt.show()
