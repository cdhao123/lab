
.PARAM CLOAD = 0
M0 Z CLK 0 0 N_50n L = 50N W = 500N
M1 X A Z 0 N_50n L = 50N W = 500N
M2 Y1 B X 0 N_50n L = 50N W = 500N
M3 Y1 CLK VDD VDD P_50n L = 50N W = 250N

M4 X2 C Z 0 N_50n L = 50N W = 500N
M5 Y2 D X2 X2 N_50n L = 50N W = 500N
M6 Y2 CLK VDD VDD P_50n L = 50N W = 250N

M7 Y CLKB 0 0 N_50n L = 50N W = 500N
M8 Y Y1 Z3 VDD P_50n L = 50N W = 250N
M9 Z3 Y2 Z2 VDD P_50n L = 50N W = 250N
M10 Z2 CLKB VDD VDD P_50n L = 50N W = 250N
C1 Y 0 1F

M11 CLKB CLK 0 0 N_50n L = 50N W = 500N
M12 CLKB CLK VDD VDD P_50n L = 50N W = 250N

VCLK CLK 0 PULSE 0 1 1.995N 0.01N 0.01N 2N 4N
VDD VDD 0 1
VA A 0 PULSE 0 1 5.995N 0.01N 0.01N 2N 8N
VB B 0 PWL 0 0 10N 0 10.01N 1 12N 1 12.01N 0 14N 0 14.01N 1 16N 1 R
VC C 0 PWL 0 0 18N 0 18.01N 1 20N 1 20.01N 0 22N 0 22.01N 1 24N 1 24.01N 0 26N 0 26.01N 1 28N 1 28.01N 0 30N 0 30.01N 1 32N 1 R
VD D 0 PWL 0 0 2N 0 2.01N 1 4N 1 4.01N 0 6N 0 6.01N 1 8N 1 R TD=32N
.INCLUDE '..\model1\rf018.l'
* .DC VIN 0 1 0.001
.TRAN 0.001N 66N START = 0

.measure tran thl when V(Y) = 0.5 fall = 1
.measure tran tlh when V(Y) = 0.5 rise = 1

.OPTION LIST NODE BRIEF=1 
.OPTION POST=3
.END