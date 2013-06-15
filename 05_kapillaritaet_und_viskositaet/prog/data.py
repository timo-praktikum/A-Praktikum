from numpy import loadtxt, sqrt, pi, mean, log, linspace
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
h_dest = h_Fluid[0:3]
h_methol = h_Fluid[3:6]
h_glykol = h_Fluid[6:9]

#Oberflächenspannung dest. Wasser
#Oberflächenspannung Methol-Alkohol
#Oberflächenspannung Aethylenglykol

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
