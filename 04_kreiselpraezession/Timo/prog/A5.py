#!/usr/bin/env python3

sigma_T_n = 0.5

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
	omega_n = 2*10*np.pi/data[0:length,1] #Praezessionsgeschwindigkeit
	sigma_omega_n = sigma_T_n*2*10*np.pi/data[0:length,1]**2 #Fehlerfortpflanzung

	omega_r = 2*np.pi/data[:,0]
#	print(omega_r)
	for i in range(0,length):
		omega_r[i] = (omega_r[i]+omega_r[i+1])/2
	omega_r = omega_r[0:length]
#	print(omega_r)
	
	return omega_r,omega_n,sigma_omega_n

def lin_reg(x,y,sigma_y):
	X = sm.add_constant(x,False)
	wls_model = sm.WLS(y,X,weights=1/sigma_y**2)
	results = wls_model.fit()
	
	Delta = sum(1/sigma_y**2) * sum(x**2/sigma_y**2) - (sum(x/sigma_y**2))**2
	sigma_m = np.sqrt(1/Delta * sum(1/sigma_y**2))
	return results.params[0],results.params[1],sigma_m

omega_r1,omega_n1,sigma_omega_n1 = load_data("../data/kreisel_nutation_1.dat",3)
m1,y1,sigma_m1 = lin_reg(omega_r1,omega_n1,sigma_omega_n1)
print(m1,sigma_m1)
omega_r2,omega_n2,sigma_omega_n2 = load_data("../data/kreisel_nutation_2.dat",3)
m2,y2,sigma_m2 = lin_reg(omega_r2,omega_n2,sigma_omega_n2)
print(m2,sigma_m2)
omega_r3,omega_n3,sigma_omega_n3 = load_data("../data/kreisel_nutation_3.dat",3)
m3,y3,sigma_m3 = lin_reg(omega_r3,omega_n3,sigma_omega_n3)
print(m3,sigma_m3)
mean_m = func.weighted_mean(np.array([m1,m2,m3]),np.array([sigma_m1,sigma_m2,sigma_m3]))
print(mean_m)

import matplotlib.pyplot as plt
x = np.arange(60,130,10)
plt.figure(1)
plt.grid(True)
plt.xlim(60,120)
plt.ylim(5,20)
plt.errorbar(omega_r1,omega_n1,yerr=sigma_omega_n1,fmt='ks',label='Messung 1')
plt.plot(x,m1*x+y1,'k-',label='%f*$\\omega_r$+%f' % (m1,y1))
plt.errorbar(omega_r2,omega_n2,yerr=sigma_omega_n2,fmt='ko',label='Messung 2')
plt.plot(x,m2*x+y2,'k--',label='%f*$\\omega_r$+%f' % (m2,y2))
plt.errorbar(omega_r3,omega_n3,yerr=sigma_omega_n3,fmt='k^',label='Messung 3')
plt.plot(x,m3*x+y3,'k:',label='%f*$\\omega_r$+%f' % (m3,y3))
plt.xlabel(u"$\\omega_r\, [1/s]$",fontsize=20)
plt.ylabel(u"$\\omega_n$\, [1/s]",fontsize=20)
plt.legend(numpoints=1,loc=4)
plt.tight_layout(.5)
plt.savefig('A5.pgf')
