
.PARAM VINA = 1 VINB = 1
M0 VM0D VINB 0 0 N_50n L = 50N W = 0.5U
M1 VOUT VINA VM0D 0 N_50n L = 50N W = 0.5U
M2 VOUT VINA VDD VDD P_50n L = 50N W = 1U
M3 VOUT VINB VDD VDD P_50n L = 50N W = 1U

V1 VINA 0 VINA
V2 VINB 0 VINB

VDD VDD 0 1
.INCLUDE 'C:\sdsy\model1\rf018.l'
.DC VINB 0 1 0.001
.DC VINA 0 1 0.001
* .TRAN 0.01N 40N START = 0

.OPTION LIST NODE BRIEF=1 
.OPTION POST=3

.END