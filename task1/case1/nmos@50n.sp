
.PARAM VG = 0.5 VDD = 0.85 VDS = 1 LEN = 0.5U WID = 1U
M1 VIN VDD 0 0 N_50n L = LEN W = WID
.INCLUDE 'C:\sdsy\model1\rf018.l'
VDD VDD 0 VDD
VIN VIN 0 VDS

.DC VIN 0 1 0.001

.PRINT i(M1) v(VIN)

.OPTION LIST NODE BRIEF=1 
.OPTION POST=3

.ALTER
.PARAM LEN = 0.2U WID = 0.4U
.ALTER
.PARAM LEN = 0.09U WID = 0.18U
.ALTER
.PARAM LEN = 0.05U WID = 0.1U

.END