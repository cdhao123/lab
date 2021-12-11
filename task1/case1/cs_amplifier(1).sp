** A common-source amplifier exmple

** Netlist of devices
.PARAM R1=1000 VB1=0.98
R1 VDD VOUT R1 
M1 VOUT VIN 0 0  NCH L=0.18U W=5U 
CLOAD VOUT 0 0.75P

** Stimulate sources
VDD VDD 0 1.8
VIN VIN 0 VB1 AC  SIN(VB1 0.01 10)

**Analysis statements
* op工作点分析
* .OP
* .DC VIN 0 1.8 0.001
* .TRAN 0.01m 1 
.AC DEC 10 1K 10G 

**Output all node voltages and branch currents
.PRINT i(M1) i(R1)

** simulator options
.OPTION LIST NODE BRIEF=1 
.OPTION POST=3

**model libary

.lib 'C:\sdsy\model1\rf018.l' TT


***
*.ALTER
*.PARAM R1=1000
*.ALTER 
*.PARAM R1=2000
.END