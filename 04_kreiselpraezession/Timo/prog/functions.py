import numpy, math

def weighted_mean(arr,err):
	print(arr,err)
	a,b = numpy.average(arr,weights=1./err**2,returned=True)
	sigma_a = math.sqrt(1/b)
	return a,sigma_a

