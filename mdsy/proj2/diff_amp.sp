** A differential pair exmple

** Netlist of devices
*M2 VDD VDD VOUT 0 N18 L=0.18U W=12.5U

I1 VDD VB 0.5m
M4 VB VB 0 0 N18 W=60U L=1U  
M3 VP VB 0 0 N18 W=60U L=1U
M1 VON VIP VP 0 N18 W=10U L=0.18U
M2 VOP VIN VP 0 N18 W=10U L=0.18U
R1 VDD VOP 1K
R2 VDD VON 1K 
CLOADP VOP 0 0.75P
CLOADN VON 0 0.75P

.PARAM VCM=0.9 VDM=0 VAM=0.01
** Stimulate sources
VDD VDD 0 1.8
*VB VB 0 1.1
VIC VCM 0 DC=VCM 
VIN VIN VCM DC=VDM AC=1 SIN(0 VAM 100MEG) 
VIP VCM VIP DC=VDM AC=1 SIN(0 VAM 100MEG)



**Analysis statements
.OP
.DC VDM START=-1 STOP=1 STEP=0.001
.TRAN 0.01n 100n 
.AC DEC 10 1K 10G 

**Output all node voltages and branch currents
.PRINT

** simulator options
.OPTION LIST NODE BRIEF=1
.OPTION POST=3
**model libary

.lib 'E:\work\Teaching\hspice_example\model\ms018_v1p7.lib' TT

.END