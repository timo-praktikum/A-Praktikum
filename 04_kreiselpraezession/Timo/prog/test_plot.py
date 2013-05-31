#!/usr/bin/env python3

import matplotlib as mpl
mpl.use("pgf")
mpl.rcParams.update({'pgf.texsystem': 'pdflatex'})

import matplotlib.pyplot as plt
plt.figure(1)
plt.plot(range(5))
plt.xlabel(u"$\\frac{1}{\\rho}")
plt.tight_layout(.5)
plt.savefig('test.pgf')
