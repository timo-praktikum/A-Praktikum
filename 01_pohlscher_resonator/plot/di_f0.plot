reset

set terminal epslatex color

set macros

NOXLABEL = "set xtics ('' 0,'' 5,'' 10,'' 15,'' 20); unset xlabel"
XLABEL = "set xtics ('0' 0,'5' 5,'10' 10,'15' 15,'20' 20); set xlabel '$t [s]$'"
NOYLABEL = "set ytics ('' -1,'' -.5,'' 0,'' .5,'' 1); unset ylabel"
YLABEL = "set ytics ('-1' -1,'-0.5' -.5,'0' 0,'0.5' .5,'1' 1); set ylabel '$\\varphi/\\varphi_0$'"

TMARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.55"
BMARGIN = "set tmargin at screen 0.55; set bmargin at screen 0.20"
LMARGIN = "set lmargin at screen 0.15; set rmargin at screen 0.55"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95"

set grid
set key top right

set xrange [0:25]
set yrange [-1.5:1.5]

set output 'plot_dif0.tex'

set multiplot layout 2,2 rowsfirst

# --- 0mm
@NOXLABEL; @YLABEL
@TMARGIN; @LMARGIN
plot 'd0_f0.txt' u (($1-3109.4)/1000):($2/120) with dots lw 2 lt 1 title "Dämpfung 0mm"

# --- 4mm
@NOXLABEL; @NOYLABEL
@TMARGIN; @RMARGIN
plot 'd4_f0.txt' u (($1-3484.4)/1000):($2/120) with dots lw 2 lt 1 title "Dämpfung 4mm"

# --- 6mm
@XLABEL; @YLABEL
@BMARGIN; @LMARGIN
plot 'd6_f0.txt' u (($1-3687.5)/1000):($2/120) with dots lw 2 lt 1 title "Dämpfung 6mm"

# --- 8mm
@XLABEL; @NOYLABEL
@BMARGIN; @RMARGIN
plot 'd8_f0.txt' u (($1-1984.4)/1000):($2/120) with dots lw 2 lt 1 title "Dämpfung 8mm"

unset multiplot

set output
!epstopdf plot_dif0.eps
