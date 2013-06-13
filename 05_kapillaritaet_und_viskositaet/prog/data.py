from numpy import loadtxt, sqrt, pi, mean
import matplotlib.pyplot as plt

#Aufgabe 1

d_Kapillare = (loadtxt('../data/durchmesser_messung'))*10**(-3)
sigma_d_Kapillare = 0.01e-3
d_gruen = mean((d_Kapillare[0:3])[:,0]-(d_Kapillare[0:3])[:,1])
d_blau = mean((d_Kapillare[3:6])[:,0]-(d_Kapillare[3:6])[:,1])
d_rot = mean((d_Kapillare[6:9])[:,0]-(d_Kapillare[6:9])[:,1])
sigma_d = sigma_d_Kapillare/sqrt(3)

g = 9.81

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

auslauf_messung = loadtxt('../data/auslauf_2b')
t = auslauf_messung[:,0]
h = auslauf_messung[:,1]
