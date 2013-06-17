#!/usr/bin/env python3

import numpy as np
import math
import statsmodels.api as sm

def weighted_mean(arr,err)
	a,b = np.average(arr,weights=1./err**2,returned=True)
	sigma_a = math.sqrt(1/b)
	return a,sigma_a

def lin_reg(x,y,sigma_y):
	X = sm.add_constant(x,False)
	wls_model = sm.WLS(y,X,weights=1/sigma_y**2)
	results = wls_model.fit()
	
	Delta = sum(1/sigma_y**2) * sum(x**2/sigma_y**2) - (sum(x/sigma_y**2))**2
	sigma_m = np.sqrt(1/Delta * sum(1/sigma_y**2))
	return results.params[0],results.params[1],sigma_m
