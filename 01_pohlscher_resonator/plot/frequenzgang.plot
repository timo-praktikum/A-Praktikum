reset
set terminal epslatex color dashed

set xrange [0:2]
set yrange [0:8]
set xlabel '$\omega/\omega_0$'
set ylabel '$\phi_0(\omega)/\phi_0(0)$'

set style line 1 lc rgb 'black' lt 2 lw 1
set style line 2 lc rgb 'black' lt 1 lw 1
set style line 3 lc rgb 'black' lt 5 lw 1
set style line 4 lc rgb 'black' pt 7 ps 0.5
set style line 5 lc rgb 'black' pt 5 ps 0.8
set style line 6 lc rgb 'black' pt 9 ps 0.8
set style line 7 lc rgb 'black' pt 13 ps 0.8
#set pointintervalbox 3

set output 'frequenzgang.tex'
p 'd4.mat' smooth csplines ls 1 title '4mm','d4.mat' w p ls 5 notitle,'d6.mat' smooth csplines ls 2 title '6mm','d6.mat' w p ls 6 notitle,'d8.mat' smooth csplines ls 3 title '8mm','d8.mat' w p ls 7 notitle,'vertical.mat' w p ls 4 notitle

set output
!epstopdf frequenzgang.eps
