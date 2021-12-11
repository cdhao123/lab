
* .PARAM VDD = 1 VGS = 1 LN = 0.05U LP = 0.05U WN = 1U WP = 0.5U
* M1 VOUT VIN 0 0 N_50n L = LN W = WN
* M2 VOUT VIN VDD VDD P_50n L = LP W = WP
* C1 
.PARAM VDD = 1 LN = 0.05U LP = 0.05U WN = 0.4U WP = 1U CAP = 0
M1 VOUT VIN 0 0 N_50n L = LN W = WN
M2 VOUT VIN VDD VDD P_50n L = LP W = WP
C1 VOUT 0 CAP
.INCLUDE 'C:\sdsy\model1\rf018.l'

VDD VDD 0 VDD
VIN VIN 0 PULSE (0 1 5NS 0.01NS 0.01NS 5NS)

.TRAN 0.001NS 25NS START = 0S STOP = 25NS
* .measure tran tdlay1f trig V(VOUT) val=0.5 td=5n rise=1 targ V(VOUT) val=1 fall=1
.measure tran thl when V(VOUT) = 0.5 fall = 1
.measure tran tlh when V(VOUT) = 0.5 rise = 1
.PRINT v(VIN) v(VOUT)



.OPTION LIST NODE BRIEF=1 
.OPTION POST=3

.ALTER
.PARAM CAP = 1.0e-13
.ALTER
.PARAM CAP = 2.0e-13
.ALTER
.PARAM CAP = 3.0e-13

.END