reset
set terminal epslatex color
set xrange [0:6]
set yrange [-1:1]
set xlabel '$\omega_e t$'
set ylabel '$\frac {\phi} {\phi_0}$'
set label '$\sim \cos(\omega t)$' at 1.5,0.25
set label '$\sim e^{- \beta t}$' at 0.75,0.6
unset key

set output 'frei.tex'
p exp(-0.5*x)*cos(5*x) lc rgbcolor 'black',0 lc rgbcolor 'black',exp(-0.5*x) w dots lc rgbcolor 'black',-exp(-0.5*x) w dots lc rgbcolor 'black'

set output
!epstopdf frei.eps
