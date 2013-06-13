#!/usr/bin/env python3

sigma_T_p = 0.5
r = 0.2705
sigma_r = 0.0005
g = 9.8116

import matplotlib as mpl
mpl.use("pgf")
mpl.rcParams.update({'pgf.texsystem':'pdflatex',
"pgf.preamble": [
         r"\usepackage[utf8]{inputenc}",
         r"\usepackage[T1]{fontenc}",
         r"\usepackage{lmodern}",
	 r"\usepackage{textcomp}",
	 r"\usepackage{ucs}",
	 r"\usepackage{amsfonts}",
	 r"\usepackage{amstext}",
	 r"\usepackage{amsmath}"]})

import numpy as np
import statsmodels.api as sm
import functions as func

def load_data(path,length):
	data = np.loadtxt(path)
	omega_p = np.pi/data[0:length,1] #Praezessionsgeschwindigkeit
	sigma_omega_p = sigma_T_p*np.pi/data[0:length,1]**2 #Fehlerfortpflanzung

	omega_r = 2*np.pi/data[:,0]
	#print(omega_r)
	for i in range(0,length):
		omega_r[i] = (omega_r[i]+omega_r[i+1])/2
	omega_r = omega_r[0:length]
	#print(omega_r)
	
	return omega_r,omega_p,sigma_omega_p

def lin_reg(x,y,sigma_y):
	X = sm.add_constant(x,False)
	wls_model = sm.WLS(y,X,weights=1/sigma_y**2)
	results = wls_model.fit()
	
	Delta = sum(1/sigma_y**2) * sum(x**2/sigma_y**2) - (sum(x/sigma_y**2))**2
	sigma_m = np.sqrt(1/Delta * sum(1/sigma_y**2))
	return results.params[0],results.params[1],sigma_m

def mom_inert(m,g,r,sigma_r,x,sigma_x):
	I = m*g*r/x
	sigma_I = m*g/x * np.sqrt(sigma_r**2 + sigma_x**2*r**2/x**2)
	return I,sigma_I

omega_r1,omega_p1,sigma_omega_p1 = load_data("../data/kreisel_praezession_20g.dat",3)
m1,y1,sigma_m1 = lin_reg(1/omega_r1,omega_p1,sigma_omega_p1)
I1,sigma_I1 = mom_inert(0.02,g,r,sigma_r,m1,sigma_m1)
print("Masse: 20g")
print("Steigung: ",m1,"+-",sigma_m1)
print("Trägheitsmoment: ",I1,"+-",sigma_I1)
print("----------------------------------------------------------------")
omega_r2,omega_p2,sigma_omega_p2 = load_data("../data/kreisel_praezession_40g.dat",4)
m2,y2,sigma_m2 = lin_reg(1/omega_r2,omega_p2,sigma_omega_p2)
I2,sigma_I2 = mom_inert(0.04,g,r,sigma_r,m2,sigma_m2)
print("Masse: 40g")
print("Steigung: ",m2,"+-",sigma_m2)
print("Trägheitsmoment: ",I2,"+-",sigma_I2)
print("----------------------------------------------------------------")
omega_r3,omega_p3,sigma_omega_p3 = load_data("../data/kreisel_praezession_60g.dat",4)
m3,y3,sigma_m3 = lin_reg(1/omega_r3,omega_p3,sigma_omega_p3)
I3,sigma_I3 = mom_inert(0.06,g,r,sigma_r,m3,sigma_m3)
print("Masse: 60g")
print("Steigung: ",m3,"+-",sigma_m3)
print("Trägheitsmoment: ",I3,"+-",sigma_I3)
print("----------------------------------------------------------------")
mean_I = func.weighted_mean(np.array([I1,I2,I3]),np.array([sigma_I1,sigma_I2,sigma_I3]))
print("Gewichteter Mittelwert Trägheitsmoment: ",mean_I)

import matplotlib.pyplot as plt
x = np.arange(0,0.06,0.01)
plt.figure(1)
plt.grid(True)
plt.xlim(0,0.05)
plt.ylim(0,0.5)
plt.errorbar(1/omega_r1,omega_p1,yerr=sigma_omega_p1,fmt='ks',label='20g')
plt.plot(x,m1*x+y1,'k-',label='%f*$\\omega_r^{-1}$+%f' % (m1,y1))
plt.errorbar(1/omega_r2,omega_p2,yerr=sigma_omega_p2,fmt='ko',label='40g')
plt.plot(x,m2*x+y2,'k--',label='%f*$\\omega_r^{-1}$+%f' % (m2,y2))
plt.errorbar(1/omega_r3,omega_p3,yerr=sigma_omega_p3,fmt='k^',label='60g')
plt.plot(x,m3*x+y3,'k:',label='%f*$\\omega_r^{-1}$+%f' % (m3,y3))
plt.xlabel(u"$1/\\omega_r\, [s]$",fontsize=20)
plt.ylabel(u"$\\omega_p\, [1/s]$",fontsize=20)
plt.legend(numpoints=1,loc=4)
plt.tight_layout(.5)
plt.savefig('A3.pgf')
