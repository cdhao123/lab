
.PARAM VDD = 1.7 VCM = 0.872 WN = 170U VDM = 0
.PARAM VDM1 = VDM/2
.subckt DIFFAMP VDD VIN1 VIN2 N1 N2 0
I1 VDD N5 10U
M0 N3 N5 0 0 NCH W = 310U L = 1.15U
M1 N1 VIN1 N3 0 NCH W = 171.7U L = 0.35U
M2 N2 VIN2 N3 0 NCH W = 168.3U L = 0.35U
M3 N1 N1 VDD VDD PCH W = 9.2U L = 0.18U
M4 N2 N2 VDD VDD PCH W = 9.2U L = 0.18U
M5 N1 N4 VDD VDD PCH W = 329.55U L = 0.5U
M8 N2 N4 VDD VDD PCH W = 329.55U L = 0.5U
M7 N4 N4 VDD VDD PCH W = 153.3U L = 1U
M9 N4 N5 0 0 NCH W = 24U L = 1U
M10 N5 N5 0 0 NCH W = 1.7U L = 1.65U
C1 N1 0 2P
C2 N2 0 2P
.ends

.TEMP 100

XAMP1 VDD VIN11 VIN21 N11 N21 0 DIFFAMP
XAMP2 VDD VIN12 VIN22 N12 N22 0 DIFFAMP

VDD VDD 0 1.7
* VIC VCM 0 DC=VCM 
* VIN VIN VCM DC=VDM AC=1 SIN(0 VAM 100MEG) 
* VIP VCM VIP DC=VDM AC=1 SIN(0 VAM 100MEG)
VIC VCM 0 DC=0.872
VIN1 VIN11 VCM VDM1 AC=0.5
VIN2 VCM VIN21 VDM1 AC=0.5

VIC2 VCM2 0 DC=0.872 AC = 1
VIN11 VIN12 VCM2 VDM1
VIN22 VCM2 VIN22 VDM1


.AC DEC 50 10 10G
* .OP
* .DC WN 48U 70U 0.01U
* .DC VDM -100M 100M 0.001
* .DC VCM 0 1.8 0.001
* .PRINT ISS = par('LX4(M0)')
* .DC WP 5U 10U 0.1U


.OPTION LIST NODE BRIEF=1 
.OPTION POST=3

.lib 'C:\mdsy\rf018.l' SS
.END