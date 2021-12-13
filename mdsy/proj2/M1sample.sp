
.PARAM VDD = 1 WN = 5U
M1 VDD VIN VP 0 NCH L = 0.18U W = WN
VDD VDD 0 VDD
VBIAS VP 0 0.2
VIN VIN 0 0

.DC VIN 0 1.8 0.001
* .DC WP 5U 10U 0.1U

.PRINT GM = par('LX7(M1)') IDS = par('LX4(M1)') VTH = par('LV9(M1)')

.OPTION LIST NODE BRIEF=1 
.OPTION POST=3

.lib 'C:\mdsy\rf018.l' TT
.END