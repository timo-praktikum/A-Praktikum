#!/usr/bin/env python3

z = 0.245/2
m = 0.1
g = 9.8116

import numpy as np
import functions as func

def load_data(path):
	T = np.loadtxt(path)
	sigma_T = np.sqrt(1./(T.size-1)*sum((T-T.mean())**2))
	
	return T,sigma_T

def mom_inert(T,sigma_T,z,m,g):
	I = T**2 * z*m*g/4/np.pi**2 - m*z**2
	sigma_I = T * sigma_T*z*m*g/2/np.pi**2
	return I,sigma_I

T,sigma_T = load_data("../data/T_Pendel.dat")
I,sigma_I = mom_inert(T,sigma_T,z,m,g)

print("I: ",I)
print("sigma_I: ",sigma_I)

mean_I = func.weighted_mean(I,sigma_I)

print("mean_I: ",mean_I)
