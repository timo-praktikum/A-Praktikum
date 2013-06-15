from numpy import sqrt

def linreg(x,y,yerr):
	sigma_sum = sum([1/(z)**2 for z in yerr])
	x2_sigma_sum = sum([z**2/(yerr[x.index(z)])**2 for z in x])
	x_sigma_sum = sum([z/(yerr[x.index(z)])**2 for z in x])
	xy_sigma_sum = sum([z*y[x.index(z)]/(yerr[x.index(z)])**2 for z in x])
	y_sigma_sum = sum([z/(yerr[y.index(z)])**2 for z in y])
	Delta = sigma_sum*x2_sigma_sum-x_sigma_sum**2
	m=(1/Delta)*((sigma_sum*xy_sigma_sum)-(x_sigma_sum*y_sigma_sum))
	b=(1/Delta)*((x2_sigma_sum*y_sigma_sum)-(x_sigma_sum*xy_sigma_sum))
	sigma_m = sqrt((1/Delta)*sigma_sum)
	sigma_b = sqrt((1/Delta)*x2_sigma_sum)
	return [b,m,sigma_b,sigma_m]
