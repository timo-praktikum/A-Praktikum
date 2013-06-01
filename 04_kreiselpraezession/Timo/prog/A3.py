#!/usr/bin/env python3

sigma_T_p = 0.1

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
	 r"\usepackage{amsmath}"],
"pgf.axes.labelsize":'large'})

import numpy as np
import scikits.statsmodels.api as sm

def load_data(path,length):
	data = np.loadtxt(path)
	omega_p = np.pi/data[0:length,1] #Praezessionsgeschwindigkeit
	sigma_omega_p = sigma_T_p*np.pi/data[0:length,1] #Fehlerfortpflanzung

	omega_r = 2*np.pi/data[:,0]
	print(omega_r)
	for i in range(0,length):
		omega_r[i] = (omega_r[i]+omega_r[i+1])/2
	omega_r = omega_r[0:length]
	print(omega_r)
	
	return omega_r,omega_p,sigma_omega_p

def lin_reg(x,y,sigma_y):
	x = sm.add_constant(x,False)
	wls_model = sm.WLS(y,x,weights=1/sigma_y**2)
	results = wls_model.fit()
	return results.params[0],results.params[1]

omega_r1,omega_p1,sigma_omega_p1 = load_data("../data/kreisel_praezession_20g.dat",3)
m1,y1 = lin_reg(1/omega_r1,omega_p1,sigma_omega_p1)
#print(m1,omega_p1)
omega_r2,omega_p2,sigma_omega_p2 = load_data("../data/kreisel_praezession_40g.dat",4)
m2,y2 = lin_reg(1/omega_r2,omega_p2,sigma_omega_p2)
#print(m2,omega_p2)
omega_r3,omega_p3,sigma_omega_p3 = load_data("../data/kreisel_praezession_60g.dat",4)
m3,y3 = lin_reg(1/omega_r3,omega_p3,sigma_omega_p3)
#print(m3,omega_p3)

import matplotlib.pyplot as plt
x = np.arange(0,0.06,0.01)
plt.figure(1)
plt.xlim(0,0.05)
plt.ylim(0,0.5)
plt.errorbar(1/omega_r1,omega_p1,yerr=sigma_omega_p1,fmt='ks',label='20g')
plt.plot(x,m1*x+y1,'k-',label='test')
plt.errorbar(1/omega_r2,omega_p2,yerr=sigma_omega_p2,fmt='ko',label='40g')
plt.plot(x,m2*x+y2,'k-',label='test')
plt.errorbar(1/omega_r3,omega_p3,yerr=sigma_omega_p3,fmt='k^',label='60g')
plt.plot(x,m3*x+y3,'k-',label='test')
plt.xlabel(u"\\huge{$\\omega_r$}")
plt.ylabel(u"\\huge{$\\omega_p$}")
plt.legend(numpoints=1)
plt.tight_layout(.5)
plt.savefig('A3.pgf')
