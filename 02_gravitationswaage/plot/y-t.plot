reset
set terminal epslatex color dashed

NR = 2

datei(n) = sprintf('../data/data%d.csv',n)
set macros
EPS = 'y-t_'.NR.'.eps'

set xlabel '$t [s]$'
set ylabel '$y(t) [m]$'
set title 'Messung '.NR
unset key

set style line 1 lc rgb 'black' pt 1 ps 0.7
#set style line 1 lc rgb 'black' lt 2 lw 1
#set style line 2 lc rgb 'black' lt 1 lw 1
#set style line 3 lc rgb 'black' lt 5 lw 1
#set style line 4 lc rgb 'black' pt 7 ps 0.5
#set style line 5 lc rgb 'black' pt 5 ps 0.8
#set style line 6 lc rgb 'black' pt 9 ps 0.8
#set style line 7 lc rgb 'black' pt 13 ps 0.8

set output 'y-t_'.NR.'.tex'
p datei(NR) u 1:($2/100) w p ls 1

set output
!epstopdf @EPS
