EESchema Schematic File Version 2
LIBS:shield-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:xc9572xl
LIBS:shield-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Toslink CNC Control Arduino Shield"
Date "2015-10-27"
Rev "1.0"
Comp "Institute IRNAS Rače"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L DLT1111 U6
U 1 1 561CCAC8
P 5850 1650
F 0 "U6" H 6000 1950 60  0000 C CNN
F 1 "DLT1111" H 5850 1750 60  0000 C CNN
F 2 "VQFP44:DLT1111" H 5850 1150 60  0001 C CNN
F 3 "" H 5850 1150 60  0000 C CNN
	1    5850 1650
	1    0    0    -1  
$EndComp
$Comp
L DLR1111 U3
U 1 1 561CCC48
P 4500 1650
F 0 "U3" H 4650 1950 60  0000 C CNN
F 1 "DLR1111" H 4500 1750 60  0000 C CNN
F 2 "VQFP44:DLR1111" H 4500 1150 60  0001 C CNN
F 3 "" H 4500 1150 60  0000 C CNN
	1    4500 1650
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P5
U 1 1 561CD4B3
P 2400 3100
F 0 "P5" H 2400 3550 50  0000 C CNN
F 1 "Arduino Power Pins" V 2500 3100 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x08" H 2300 3650 60  0001 C CNN
F 3 "" H 2400 3100 60  0000 C CNN
	1    2400 3100
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X06 P6
U 1 1 561CD650
P 2400 4150
F 0 "P6" H 2400 4500 50  0000 C CNN
F 1 "Arduino Analog Pins" V 2500 4150 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x06" H 2300 4600 60  0001 C CNN
F 3 "" H 2400 4150 60  0000 C CNN
	1    2400 4150
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X08 P8
U 1 1 561CD6AD
P 7600 4450
F 0 "P8" H 7600 4900 50  0000 C CNN
F 1 "Arduino Digital Pins (0-7)" V 7700 4450 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x08" V 7800 4250 60  0001 C CNN
F 3 "" H 7600 4450 60  0000 C CNN
	1    7600 4450
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X10 P7
U 1 1 561CD771
P 7600 3300
F 0 "P7" H 7600 3850 50  0000 C CNN
F 1 "Arduino Digital Pins (8-13)" V 7700 3300 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x10" V 7800 3300 60  0001 C CNN
F 3 "" H 7600 3300 60  0000 C CNN
	1    7600 3300
	1    0    0    -1  
$EndComp
Text GLabel 2600 3350 2    60   Input ~ 0
GND
Text GLabel 2600 3250 2    60   Input ~ 0
GND
Text GLabel 2600 3150 2    60   Input ~ 0
5V
NoConn ~ 2600 2750
NoConn ~ 2600 2850
NoConn ~ 2600 3450
Text GLabel 7400 4300 0    60   Input ~ 0
D2
Text GLabel 7400 4400 0    60   Input ~ 0
D3
Text GLabel 7400 4500 0    60   Input ~ 0
D4
Text GLabel 7400 4600 0    60   Input ~ 0
D5
Text GLabel 7400 4700 0    60   Input ~ 0
D6
Text GLabel 7400 4800 0    60   Input ~ 0
D7
Text GLabel 7400 2850 0    60   Input ~ 0
D8
Text GLabel 7400 2950 0    60   Input ~ 0
D9
Text GLabel 7400 3050 0    60   Input ~ 0
D10
Text GLabel 7400 3150 0    60   Input ~ 0
D11
Text GLabel 7400 3450 0    60   Input ~ 0
GND
Text GLabel 6800 4500 2    60   Input ~ 0
D2
Text GLabel 6600 4500 0    60   Input ~ 0
STP_X
Text GLabel 6800 4350 2    60   Input ~ 0
D3
Text GLabel 6600 4050 0    60   Input ~ 0
DIR_X
Text GLabel 6800 4200 2    60   Input ~ 0
D4
Text GLabel 6600 4350 0    60   Input ~ 0
STP_Y
Text GLabel 6800 4050 2    60   Input ~ 0
D5
Text GLabel 6600 3900 0    60   Input ~ 0
DIR_Y
Text GLabel 6800 3900 2    60   Input ~ 0
D6
Text GLabel 6600 4200 0    60   Input ~ 0
STP_Z
Text GLabel 6800 3750 2    60   Input ~ 0
D7
Text GLabel 6600 3750 0    60   Input ~ 0
DIR_Z
Text GLabel 6800 3500 2    60   Input ~ 0
D8
Text GLabel 6600 3500 0    60   Input ~ 0
ENABLE
Text GLabel 6800 3350 2    60   Input ~ 0
D9
Text GLabel 6600 3350 0    60   Input ~ 0
LIMIT_X
Text GLabel 6750 3200 2    60   Input ~ 0
D10
Text GLabel 6550 3200 0    60   Input ~ 0
LIMIT_Y
Text GLabel 6750 3050 2    60   Input ~ 0
D11
Text GLabel 6550 3050 0    60   Input ~ 0
LIMIT_Z
Text GLabel 3600 4050 0    60   Input ~ 0
STP_X
Text GLabel 3600 4450 0    60   Input ~ 0
DIR_X
Text GLabel 3600 4150 0    60   Input ~ 0
STP_Y
Text GLabel 3600 4250 0    60   Input ~ 0
STP_Z
Text GLabel 3600 4650 0    60   Input ~ 0
DIR_Y
Text GLabel 3600 4750 0    60   Input ~ 0
DIR_Z
Text GLabel 5600 4850 2    60   Input ~ 0
GND
Text GLabel 3600 4550 0    60   Input ~ 0
GND
Text GLabel 5600 4950 2    60   Input ~ 0
TDO
Text GLabel 5600 4750 2    60   Input ~ 0
3.3V
Text GLabel 3600 4350 0    60   Input ~ 0
3.3V
Text GLabel 5600 3850 2    60   Input ~ 0
3.3V
Text GLabel 3600 3750 0    60   Input ~ 0
TDI
Text GLabel 3600 3850 0    60   Input ~ 0
TMS
Text GLabel 3600 3950 0    60   Input ~ 0
TCK
Text GLabel 3600 3250 0    60   Input ~ 0
GND
Text GLabel 3600 2950 0    60   Input ~ 0
CLK
$Comp
L DLT1111 U7
U 1 1 561D2317
P 6500 1650
F 0 "U7" H 6650 1950 60  0000 C CNN
F 1 "DLT1111" H 6500 1750 60  0000 C CNN
F 2 "VQFP44:DLT1111" H 6500 1150 60  0001 C CNN
F 3 "" H 6500 1150 60  0000 C CNN
	1    6500 1650
	1    0    0    -1  
$EndComp
$Comp
L DLT1111 U8
U 1 1 561D2359
P 7150 1650
F 0 "U8" H 7300 1950 60  0000 C CNN
F 1 "DLT1111" H 7150 1750 60  0000 C CNN
F 2 "VQFP44:DLT1111" H 7150 1150 60  0001 C CNN
F 3 "" H 7150 1150 60  0000 C CNN
	1    7150 1650
	1    0    0    -1  
$EndComp
Text GLabel 4500 2050 3    60   Input ~ 0
GND
Text GLabel 5700 2050 3    60   Input ~ 0
GND
Text GLabel 6350 2050 3    60   Input ~ 0
GND
Text GLabel 7000 2050 3    60   Input ~ 0
GND
Text GLabel 4650 2050 3    60   Input ~ 0
5V
Text GLabel 5850 2050 3    60   Input ~ 0
5V
Text GLabel 7150 2050 3    60   Input ~ 0
5V
Text GLabel 6500 2050 3    60   Input ~ 0
5V
Text GLabel 4350 2050 3    60   Input ~ 0
FIBER_RX2
Text GLabel 6000 2050 3    60   Input ~ 0
FIBER_TX1
Text GLabel 6650 2050 3    60   Input ~ 0
FIBER_TX2
Text GLabel 7300 2050 3    60   Input ~ 0
FIBER_TX3
Text GLabel 3600 3150 0    60   Input ~ 0
FIBER_RX2
Text GLabel 3600 3450 0    60   Input ~ 0
FIBER_TX1
Text GLabel 3600 3550 0    60   Input ~ 0
FIBER_TX2
Text GLabel 3600 3650 0    60   Input ~ 0
FIBER_TX3
$Comp
L ASV_XO_50MHZ U1
U 1 1 561D403E
P 9000 2350
F 0 "U1" H 9250 2600 60  0000 C CNN
F 1 "ASV_XO_50MHZ" H 9000 2150 60  0000 C CNN
F 2 "VQFP44:ASV_XO" H 8750 2550 60  0001 C CNN
F 3 "" H 9000 2350 60  0000 C CNN
	1    9000 2350
	1    0    0    -1  
$EndComp
Text GLabel 8350 2400 0    60   Input ~ 0
GND
Text GLabel 9650 2400 2    60   Input ~ 0
CLK
Text GLabel 9650 2300 2    60   Input ~ 0
3.3V
Text GLabel 8350 2300 0    60   Input ~ 0
3.3V
$Comp
L DLR1111 U5
U 1 1 561D612A
P 5150 1650
F 0 "U5" H 5300 1950 60  0000 C CNN
F 1 "DLR1111" H 5150 1750 60  0000 C CNN
F 2 "VQFP44:DLR1111" H 5150 1150 60  0001 C CNN
F 3 "" H 5150 1150 60  0000 C CNN
	1    5150 1650
	1    0    0    -1  
$EndComp
Text GLabel 5150 2050 3    60   Input ~ 0
GND
Text GLabel 5300 2050 3    60   Input ~ 0
5V
Text GLabel 5000 2050 3    60   Input ~ 0
FIBER_RX3
$Comp
L DLR1111 U2
U 1 1 561D6208
P 3850 1650
F 0 "U2" H 4000 1950 60  0000 C CNN
F 1 "DLR1111" H 3850 1750 60  0000 C CNN
F 2 "VQFP44:DLR1111" H 3850 1150 60  0001 C CNN
F 3 "" H 3850 1150 60  0000 C CNN
	1    3850 1650
	1    0    0    -1  
$EndComp
Text GLabel 3850 2050 3    60   Input ~ 0
GND
Text GLabel 4000 2050 3    60   Input ~ 0
5V
Text GLabel 3700 2050 3    60   Input ~ 0
FIBER_RX1
Text GLabel 3600 3050 0    60   Input ~ 0
FIBER_RX1
Text GLabel 3600 3350 0    60   Input ~ 0
FIBER_RX3
$Comp
L CONN_01X06 P4
U 1 1 561D6EEE
P 2550 2100
F 0 "P4" H 2550 2450 50  0000 C CNN
F 1 "JTAG" V 2650 2100 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x06" H 2350 2500 60  0001 C CNN
F 3 "" H 2550 2100 60  0000 C CNN
	1    2550 2100
	-1   0    0    1   
$EndComp
Text GLabel 2750 2350 2    60   Input ~ 0
TMS
Text GLabel 2750 2250 2    60   Input ~ 0
TDI
Text GLabel 2750 2150 2    60   Input ~ 0
TDO
Text GLabel 2750 2050 2    60   Input ~ 0
TCK
Text GLabel 2750 1950 2    60   Input ~ 0
GND
Text GLabel 2750 1850 2    60   Input ~ 0
3.3V
Text GLabel 800  1200 3    60   Input ~ 0
GND
$Comp
L C C4
U 1 1 561DC3C7
P 800 1050
F 0 "C4" H 825 1150 50  0000 L CNN
F 1 "0,1uF" H 825 950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 838 900 30  0001 C CNN
F 3 "" H 800 1050 60  0000 C CNN
	1    800  1050
	1    0    0    -1  
$EndComp
Text GLabel 800  900  1    60   Input ~ 0
5V
Text GLabel 1150 900  1    60   Input ~ 0
5V
Text GLabel 1150 1200 3    60   Input ~ 0
GND
$Comp
L C C8
U 1 1 561DC4C9
P 1150 1050
F 0 "C8" H 1175 1150 50  0000 L CNN
F 1 "0,1uF" H 1175 950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1188 900 30  0001 C CNN
F 3 "" H 1150 1050 60  0000 C CNN
	1    1150 1050
	1    0    0    -1  
$EndComp
Text GLabel 1500 900  1    60   Input ~ 0
5V
Text GLabel 1500 1200 3    60   Input ~ 0
GND
$Comp
L C C12
U 1 1 561DC54C
P 1500 1050
F 0 "C12" H 1525 1150 50  0000 L CNN
F 1 "0,1uF" H 1525 950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1538 900 30  0001 C CNN
F 3 "" H 1500 1050 60  0000 C CNN
	1    1500 1050
	1    0    0    -1  
$EndComp
Text GLabel 1850 900  1    60   Input ~ 0
5V
Text GLabel 1850 1200 3    60   Input ~ 0
GND
$Comp
L C C16
U 1 1 561DC5C1
P 1850 1050
F 0 "C16" H 1875 1150 50  0000 L CNN
F 1 "0,1uF" H 1875 950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1888 900 30  0001 C CNN
F 3 "" H 1850 1050 60  0000 C CNN
	1    1850 1050
	1    0    0    -1  
$EndComp
Text GLabel 2200 900  1    60   Input ~ 0
5V
Text GLabel 2200 1200 3    60   Input ~ 0
GND
$Comp
L C C18
U 1 1 561DC630
P 2200 1050
F 0 "C18" H 2225 1150 50  0000 L CNN
F 1 "0,1uF" H 2225 950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2238 900 30  0001 C CNN
F 3 "" H 2200 1050 60  0000 C CNN
	1    2200 1050
	1    0    0    -1  
$EndComp
Text GLabel 2550 900  1    60   Input ~ 0
5V
Text GLabel 2550 1200 3    60   Input ~ 0
GND
$Comp
L C C20
U 1 1 561DC6A9
P 2550 1050
F 0 "C20" H 2575 1150 50  0000 L CNN
F 1 "0,1uF" H 2575 950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2588 900 30  0001 C CNN
F 3 "" H 2550 1050 60  0000 C CNN
	1    2550 1050
	1    0    0    -1  
$EndComp
Text GLabel 825  2025 1    60   Input ~ 0
3.3V
Text GLabel 825  2325 3    60   Input ~ 0
GND
$Comp
L C C2
U 1 1 561DCC37
P 825 2175
F 0 "C2" H 850 2275 50  0000 L CNN
F 1 "0,1uF" H 850 2075 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 863 2025 30  0001 C CNN
F 3 "" H 825 2175 60  0000 C CNN
	1    825  2175
	1    0    0    -1  
$EndComp
Text GLabel 1175 2025 1    60   Input ~ 0
3.3V
Text GLabel 1175 2325 3    60   Input ~ 0
GND
$Comp
L C C6
U 1 1 561DD0A5
P 1175 2175
F 0 "C6" H 1200 2275 50  0000 L CNN
F 1 "0,1uF" H 1200 2075 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1213 2025 30  0001 C CNN
F 3 "" H 1175 2175 60  0000 C CNN
	1    1175 2175
	1    0    0    -1  
$EndComp
Text GLabel 1875 2025 1    60   Input ~ 0
3.3V
Text GLabel 1875 2325 3    60   Input ~ 0
GND
$Comp
L C C14
U 1 1 561DD14E
P 1875 2175
F 0 "C14" H 1900 2275 50  0000 L CNN
F 1 "0,1uF" H 1900 2075 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1913 2025 30  0001 C CNN
F 3 "" H 1875 2175 60  0000 C CNN
	1    1875 2175
	1    0    0    -1  
$EndComp
Text GLabel 1525 2025 1    60   Input ~ 0
3.3V
Text GLabel 1525 2325 3    60   Input ~ 0
GND
$Comp
L C C10
U 1 1 561DD1F1
P 1525 2175
F 0 "C10" H 1550 2275 50  0000 L CNN
F 1 "0,1uF" H 1550 2075 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1563 2025 30  0001 C CNN
F 3 "" H 1525 2175 60  0000 C CNN
	1    1525 2175
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X05 P1
U 1 1 561DF3FA
P 1400 3125
F 0 "P1" H 1400 3425 50  0000 C CNN
F 1 "PoStep25-32  X" H 1400 2825 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x05" H 1500 3525 60  0001 C CNN
F 3 "" H 1400 1925 60  0000 C CNN
	1    1400 3125
	1    0    0    -1  
$EndComp
Text GLabel 1150 2925 0    60   Input ~ 0
ENABLE
Text GLabel 1150 3025 0    60   Input ~ 0
DIR_X
Text GLabel 1150 3125 0    60   Input ~ 0
STP_X
Text GLabel 1650 2925 2    60   Input ~ 0
GND
Text GLabel 1650 3025 2    60   Input ~ 0
GND
Text GLabel 1650 3125 2    60   Input ~ 0
GND
Text GLabel 1650 3225 2    60   Input ~ 0
GND
Text GLabel 1650 3325 2    60   Input ~ 0
GND
NoConn ~ 1150 3325
Text GLabel 1150 3225 0    60   Input ~ 0
LIMIT_X
$Comp
L CONN_02X05 P2
U 1 1 561E6A51
P 1400 3875
F 0 "P2" H 1400 4175 50  0000 C CNN
F 1 "PoStep25-32  Y" H 1400 3575 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x05" H 1450 3475 60  0001 C CNN
F 3 "" H 1400 2675 60  0000 C CNN
	1    1400 3875
	1    0    0    -1  
$EndComp
Text GLabel 1150 3675 0    60   Input ~ 0
ENABLE
Text GLabel 1150 3775 0    60   Input ~ 0
DIR_Y
Text GLabel 1150 3875 0    60   Input ~ 0
STP_Y
Text GLabel 1650 3675 2    60   Input ~ 0
GND
Text GLabel 1650 3775 2    60   Input ~ 0
GND
Text GLabel 1650 3875 2    60   Input ~ 0
GND
Text GLabel 1650 3975 2    60   Input ~ 0
GND
Text GLabel 1650 4075 2    60   Input ~ 0
GND
NoConn ~ 1150 4075
Text GLabel 1150 3975 0    60   Input ~ 0
LIMIT_Y
$Comp
L CONN_02X05 P3
U 1 1 561E6AAD
P 1400 4625
F 0 "P3" H 1400 4925 50  0000 C CNN
F 1 "PoStep25-32  Z" H 1400 4325 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x05" H 1400 4225 60  0001 C CNN
F 3 "" H 1400 3425 60  0000 C CNN
	1    1400 4625
	1    0    0    -1  
$EndComp
Text GLabel 1150 4425 0    60   Input ~ 0
ENABLE
Text GLabel 1150 4525 0    60   Input ~ 0
DIR_Z
Text GLabel 1150 4625 0    60   Input ~ 0
STP_Z
Text GLabel 1650 4425 2    60   Input ~ 0
GND
Text GLabel 1650 4525 2    60   Input ~ 0
GND
Text GLabel 1650 4625 2    60   Input ~ 0
GND
Text GLabel 1650 4725 2    60   Input ~ 0
GND
Text GLabel 1650 4825 2    60   Input ~ 0
GND
NoConn ~ 1150 4825
Text GLabel 1150 4725 0    60   Input ~ 0
LIMIT_Z
Text GLabel 6800 800  0    60   Input ~ 0
FIBER_TX1
$Comp
L PWR_FLAG #FLG01
U 1 1 561F3B2A
P 6800 800
F 0 "#FLG01" H 6800 895 50  0001 C CNN
F 1 "PWR_FLAG" H 6800 980 50  0000 C CNN
F 2 "" H 6800 800 60  0000 C CNN
F 3 "" H 6800 800 60  0000 C CNN
	1    6800 800 
	0    1    1    0   
$EndComp
Text GLabel 7750 800  0    60   Input ~ 0
FIBER_TX2
$Comp
L PWR_FLAG #FLG02
U 1 1 561F3CC8
P 7750 800
F 0 "#FLG02" H 7750 895 50  0001 C CNN
F 1 "PWR_FLAG" H 7750 980 50  0000 C CNN
F 2 "" H 7750 800 60  0000 C CNN
F 3 "" H 7750 800 60  0000 C CNN
	1    7750 800 
	0    1    1    0   
$EndComp
Text GLabel 8700 800  0    60   Input ~ 0
FIBER_TX3
$Comp
L PWR_FLAG #FLG03
U 1 1 561F3E3B
P 8700 800
F 0 "#FLG03" H 8700 895 50  0001 C CNN
F 1 "PWR_FLAG" H 8700 980 50  0000 C CNN
F 2 "" H 8700 800 60  0000 C CNN
F 3 "" H 8700 800 60  0000 C CNN
	1    8700 800 
	0    1    1    0   
$EndComp
Text GLabel 5900 800  0    60   Input ~ 0
CLK
$Comp
L PWR_FLAG #FLG04
U 1 1 561F4324
P 5900 800
F 0 "#FLG04" H 5900 895 50  0001 C CNN
F 1 "PWR_FLAG" H 5900 980 50  0000 C CNN
F 2 "" H 5900 800 60  0000 C CNN
F 3 "" H 5900 800 60  0000 C CNN
	1    5900 800 
	0    1    1    0   
$EndComp
$Comp
L PWR_FLAG #FLG05
U 1 1 561F43BE
P 3500 800
F 0 "#FLG05" H 3500 895 50  0001 C CNN
F 1 "PWR_FLAG" H 3500 980 50  0000 C CNN
F 2 "" H 3500 800 60  0000 C CNN
F 3 "" H 3500 800 60  0000 C CNN
	1    3500 800 
	0    1    1    0   
$EndComp
Text GLabel 3500 800  0    60   Input ~ 0
FIBER_RX1
$Comp
L PWR_FLAG #FLG06
U 1 1 561F508D
P 4400 800
F 0 "#FLG06" H 4400 895 50  0001 C CNN
F 1 "PWR_FLAG" H 4400 980 50  0000 C CNN
F 2 "" H 4400 800 60  0000 C CNN
F 3 "" H 4400 800 60  0000 C CNN
	1    4400 800 
	0    1    1    0   
$EndComp
Text GLabel 4400 800  0    60   Input ~ 0
FIBER_RX2
$Comp
L PWR_FLAG #FLG07
U 1 1 561F50FD
P 5300 800
F 0 "#FLG07" H 5300 895 50  0001 C CNN
F 1 "PWR_FLAG" H 5300 980 50  0000 C CNN
F 2 "" H 5300 800 60  0000 C CNN
F 3 "" H 5300 800 60  0000 C CNN
	1    5300 800 
	0    1    1    0   
$EndComp
Text GLabel 5300 800  0    60   Input ~ 0
FIBER_RX3
Text GLabel 3600 4850 0    60   Input ~ 0
ENABLE
Text GLabel 3600 4950 0    60   Input ~ 0
LIMIT_X
Text GLabel 3600 5050 0    60   Input ~ 0
LIMIT_Y
Text GLabel 5600 5050 2    60   Input ~ 0
LIMIT_Z
Text GLabel 5600 4650 2    60   Input ~ 0
GENERAL
Text GLabel 7400 3250 0    60   Input ~ 0
D12
Text GLabel 6750 2900 2    60   Input ~ 0
D12
Text GLabel 6550 2900 0    60   Input ~ 0
GENERAL
Text GLabel 7400 3350 0    60   Input ~ 0
D13
Text GLabel 2600 4300 2    60   Input ~ 0
A1
Text GLabel 2600 4200 2    60   Input ~ 0
A2
Text GLabel 2600 4100 2    60   Input ~ 0
A3
Text GLabel 2600 4000 2    60   Input ~ 0
A4
Text GLabel 2600 3900 2    60   Input ~ 0
A5
Text GLabel 2600 2950 2    60   Input ~ 0
RESET
$Comp
L TLV1117 U9
U 1 1 561DFFE7
P 8800 1400
F 0 "U9" H 9100 1700 60  0000 C CNN
F 1 "TLV1117" H 8800 1450 60  0000 C CNN
F 2 "VQFP44:SOT-223" H 8800 1250 60  0001 C CNN
F 3 "" H 8700 950 60  0000 C CNN
F 4 "3.3V" H 8800 1350 60  0000 C CNN "Voltage"
	1    8800 1400
	1    0    0    -1  
$EndComp
Text GLabel 8150 1300 0    60   Input ~ 0
GND
NoConn ~ 2600 3050
Text GLabel 8050 1400 0    60   Input ~ 0
3.3V
Text GLabel 9450 1300 2    60   Input ~ 0
5V
Text GLabel 9400 1750 3    60   Input ~ 0
GND
Text GLabel 8150 1750 3    60   Input ~ 0
GND
$Comp
L XC9572XL U4
U 1 1 561F11A2
P 4600 4000
F 0 "U4" H 5150 5300 50  0000 C CNN
F 1 "XC9572XL" H 4500 4100 50  0000 C CNN
F 2 "VQFP44:VQFP44" H 4550 3900 50  0001 C CNN
F 3 "" H 4600 4000 50  0001 C CNN
	1    4600 4000
	1    0    0    -1  
$EndComp
Text GLabel 5600 4050 2    60   Input ~ 0
RESET
Text GLabel 5600 4550 2    60   Input ~ 0
D13
Text GLabel 5600 3250 2    60   Input ~ 0
A1
Text GLabel 5600 3350 2    60   Input ~ 0
A2
Text GLabel 5600 3450 2    60   Input ~ 0
A3
Text GLabel 5600 3550 2    60   Input ~ 0
A4
Text GLabel 5600 3650 2    60   Input ~ 0
A5
Text GLabel 5600 3150 2    60   Input ~ 0
A0
Text GLabel 2600 4400 2    60   Input ~ 0
A0
NoConn ~ 5600 2950
NoConn ~ 5600 3050
NoConn ~ 5600 3750
Text GLabel 4950 5650 2    60   Input ~ 0
EXT_V
Text GLabel 4950 5750 2    60   Input ~ 0
GND
Text GLabel 4950 6350 2    60   Input ~ 0
GND
$Comp
L motor_driver_carrier U11
U 1 1 561E8714
P 4250 6000
F 0 "U11" H 4500 6600 60  0000 C CNN
F 1 "DRV8825_carrier" V 4250 6000 60  0000 C CNN
F 2 "VQFP44:DRV8825_carrier" H 4250 5450 60  0001 C CNN
F 3 "" H 3750 5800 60  0000 C CNN
	1    4250 6000
	1    0    0    -1  
$EndComp
Text GLabel 3550 6250 0    60   Input ~ 0
STP_X
Text GLabel 3550 6350 0    60   Input ~ 0
DIR_X
Text GLabel 4950 6250 2    60   Input ~ 0
5V
Text GLabel 3550 5650 0    60   Input ~ 0
ENABLE
$Comp
L CONN_01X04 P10
U 1 1 561EA27B
P 5350 6000
F 0 "P10" H 5350 6250 50  0000 C CNN
F 1 "Motor X" V 5450 6000 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x04" H 5350 6000 60  0001 C CNN
F 3 "" H 5350 6000 60  0000 C CNN
	1    5350 6000
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X03 P9
U 1 1 561EA853
P 2900 5850
F 0 "P9" H 2900 5650 50  0000 C CNN
F 1 "MicroStepJP X" H 2900 6050 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x03" H 2900 4650 60  0001 C CNN
F 3 "" H 2900 4650 60  0000 C CNN
	1    2900 5850
	-1   0    0    1   
$EndComp
Text GLabel 2650 5750 0    60   Input ~ 0
5V
Text GLabel 2650 5850 0    60   Input ~ 0
5V
Text GLabel 2650 5950 0    60   Input ~ 0
5V
Text GLabel 6650 7000 1    60   Input ~ 0
EXT_V
Text GLabel 6650 7300 3    60   Input ~ 0
GND
$Comp
L CP1 C3
U 1 1 561EDD20
P 8150 1600
F 0 "C3" H 8175 1700 50  0000 L CNN
F 1 "10uF,25V" H 8175 1500 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:TantalC_SizeA_EIA-3216_HandSoldering" H 8150 1600 60  0001 C CNN
F 3 "" H 8150 1600 60  0000 C CNN
	1    8150 1600
	1    0    0    -1  
$EndComp
$Comp
L CP1 C5
U 1 1 561EDDDB
P 9400 1600
F 0 "C5" H 9425 1700 50  0000 L CNN
F 1 "10uF,25V" H 9425 1500 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:TantalC_SizeA_EIA-3216_HandSoldering" H 9400 1600 60  0001 C CNN
F 3 "" H 9400 1600 60  0000 C CNN
	1    9400 1600
	1    0    0    -1  
$EndComp
$Comp
L CP1 C1
U 1 1 561EE240
P 6650 7150
F 0 "C1" H 6675 7250 50  0000 L CNN
F 1 "100uF,50V" H 6550 6700 50  0000 L CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02" H 6650 7150 60  0001 C CNN
F 3 "" H 6650 7150 60  0000 C CNN
	1    6650 7150
	1    0    0    -1  
$EndComp
Text GLabel 3100 6825 2    60   Input ~ 0
EXT_V
Text GLabel 3100 6925 2    60   Input ~ 0
GND
Text GLabel 3100 7525 2    60   Input ~ 0
GND
$Comp
L motor_driver_carrier U12
U 1 1 561F4178
P 2400 7175
F 0 "U12" H 2650 7775 60  0000 C CNN
F 1 "DRV8825_carrier" V 2400 7175 60  0000 C CNN
F 2 "VQFP44:DRV8825_carrier" H 2400 6625 60  0001 C CNN
F 3 "" H 1900 6975 60  0000 C CNN
	1    2400 7175
	1    0    0    -1  
$EndComp
Text GLabel 1700 7425 0    60   Input ~ 0
STP_Y
Text GLabel 1700 7525 0    60   Input ~ 0
DIR_Y
Text GLabel 3100 7425 2    60   Input ~ 0
5V
Text GLabel 1700 6825 0    60   Input ~ 0
ENABLE
$Comp
L CONN_01X04 P12
U 1 1 561F4186
P 3500 7175
F 0 "P12" H 3500 7425 50  0000 C CNN
F 1 "Motor Y" V 3600 7175 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x04" H 3500 7175 60  0001 C CNN
F 3 "" H 3500 7175 60  0000 C CNN
	1    3500 7175
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X03 P11
U 1 1 561F4191
P 1050 7025
F 0 "P11" H 1050 6825 50  0000 C CNN
F 1 "MicroStepJP Y" H 1050 7225 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x03" H 1050 5825 60  0001 C CNN
F 3 "" H 1050 5825 60  0000 C CNN
	1    1050 7025
	-1   0    0    1   
$EndComp
Text GLabel 800  6925 0    60   Input ~ 0
5V
Text GLabel 800  7025 0    60   Input ~ 0
5V
Text GLabel 800  7125 0    60   Input ~ 0
5V
Text GLabel 6250 7000 1    60   Input ~ 0
EXT_V
Text GLabel 6250 7300 3    60   Input ~ 0
GND
$Comp
L CP1 C7
U 1 1 561F41A0
P 6250 7150
F 0 "C7" H 6275 7250 50  0000 L CNN
F 1 "100uF,50V" H 6100 6700 50  0000 L CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02" H 6250 7150 60  0001 C CNN
F 3 "" H 6250 7150 60  0000 C CNN
	1    6250 7150
	1    0    0    -1  
$EndComp
Text GLabel 10600 4650 2    60   Input ~ 0
EXT_V
Text GLabel 10600 4750 2    60   Input ~ 0
GND
Text GLabel 10600 5350 2    60   Input ~ 0
GND
$Comp
L motor_driver_carrier U13
U 1 1 561F4984
P 9900 5000
F 0 "U13" H 10150 5600 60  0000 C CNN
F 1 "DRV8825_carrier" V 9900 5000 60  0000 C CNN
F 2 "VQFP44:DRV8825_carrier" H 9900 4450 60  0001 C CNN
F 3 "" H 9400 4800 60  0000 C CNN
	1    9900 5000
	1    0    0    -1  
$EndComp
Text GLabel 9200 5250 0    60   Input ~ 0
STP_Z
Text GLabel 9200 5350 0    60   Input ~ 0
DIR_Z
Text GLabel 10600 5250 2    60   Input ~ 0
5V
Text GLabel 9200 4650 0    60   Input ~ 0
ENABLE
$Comp
L CONN_01X04 P14
U 1 1 561F4992
P 11000 5000
F 0 "P14" H 11000 5250 50  0000 C CNN
F 1 "Motor Z" V 11100 5000 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x04" H 11000 5000 60  0001 C CNN
F 3 "" H 11000 5000 60  0000 C CNN
	1    11000 5000
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X03 P13
U 1 1 561F499D
P 8550 4850
F 0 "P13" H 8550 4650 50  0000 C CNN
F 1 "MicroStepJP Z" H 8550 5050 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x03" H 8550 3650 60  0001 C CNN
F 3 "" H 8550 3650 60  0000 C CNN
	1    8550 4850
	-1   0    0    1   
$EndComp
Text GLabel 8300 4750 0    60   Input ~ 0
5V
Text GLabel 8300 4850 0    60   Input ~ 0
5V
Text GLabel 8300 4950 0    60   Input ~ 0
5V
Text GLabel 5450 7000 1    60   Input ~ 0
EXT_V
Text GLabel 5450 7300 3    60   Input ~ 0
GND
$Comp
L CP1 C9
U 1 1 561F49AC
P 5450 7150
F 0 "C9" H 5475 7250 50  0000 L CNN
F 1 "100uF,50V" H 5200 6700 50  0000 L CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02" H 5450 7150 60  0001 C CNN
F 3 "" H 5450 7150 60  0000 C CNN
	1    5450 7150
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG08
U 1 1 561F594A
P 3000 6150
F 0 "#FLG08" H 3000 6245 50  0001 C CNN
F 1 "PWR_FLAG" H 3000 6330 50  0000 C CNN
F 2 "" H 3000 6150 60  0000 C CNN
F 3 "" H 3000 6150 60  0000 C CNN
	1    3000 6150
	-1   0    0    1   
$EndComp
$Comp
L PWR_FLAG #FLG09
U 1 1 561F6536
P 8650 5150
F 0 "#FLG09" H 8650 5245 50  0001 C CNN
F 1 "PWR_FLAG" H 8650 5330 50  0000 C CNN
F 2 "" H 8650 5150 60  0000 C CNN
F 3 "" H 8650 5150 60  0000 C CNN
	1    8650 5150
	-1   0    0    1   
$EndComp
$Comp
L PWR_FLAG #FLG010
U 1 1 561F70A4
P 1150 7325
F 0 "#FLG010" H 1150 7420 50  0001 C CNN
F 1 "PWR_FLAG" H 1150 7505 50  0000 C CNN
F 2 "" H 1150 7325 60  0000 C CNN
F 3 "" H 1150 7325 60  0000 C CNN
	1    1150 7325
	-1   0    0    1   
$EndComp
$Comp
L term_block J1
U 1 1 561FC34F
P 10250 900
F 0 "J1" V 10500 900 60  0000 C CNN
F 1 "term_block" V 10425 900 60  0000 C CNN
F 2 "VQFP44:terminal_block" H 10250 450 60  0001 C CNN
F 3 "" H 10200 900 60  0000 C CNN
	1    10250 900 
	0    -1   -1   0   
$EndComp
Text GLabel 10650 950  2    60   Input ~ 0
POWER
Text GLabel 10650 850  2    60   Input ~ 0
GND
$Comp
L ZENER D1
U 1 1 561E505D
P 9400 3150
F 0 "D1" H 9400 3250 50  0000 C CNN
F 1 "ZENER 24V" H 9400 3050 50  0000 C CNN
F 2 "Diodes_SMD:MELF_Standard" H 9400 3300 60  0001 C CNN
F 3 "" H 9400 3150 60  0000 C CNN
	1    9400 3150
	-1   0    0    1   
$EndComp
$Comp
L FUSE F1
U 1 1 561E531E
P 9950 3150
F 0 "F1" H 9900 2975 50  0000 C CNN
F 1 "FUSE" H 9850 3050 50  0000 C CNN
F 2 "Resistors_SMD:R_1812" H 9900 3300 60  0001 C CNN
F 3 "" H 9950 3150 60  0000 C CNN
	1    9950 3150
	-1   0    0    1   
$EndComp
$Comp
L term_block J2
U 1 1 561E6096
P 10250 1325
F 0 "J2" V 10500 1325 60  0000 C CNN
F 1 "term_block" V 10425 1325 60  0000 C CNN
F 2 "VQFP44:terminal_block" H 10250 875 60  0001 C CNN
F 3 "" H 10200 1325 60  0000 C CNN
	1    10250 1325
	0    -1   -1   0   
$EndComp
Text GLabel 10650 1375 2    60   Input ~ 0
5V
Text GLabel 10650 1275 2    60   Input ~ 0
GND
Text GLabel 9100 3600 0    60   Input ~ 0
GND
Text GLabel 10400 3900 3    60   Input ~ 0
GND
Text GLabel 9100 4050 3    60   Input ~ 0
GND
$Comp
L CP1 C11
U 1 1 561F11C8
P 9100 3900
F 0 "C11" H 9125 4000 50  0000 L CNN
F 1 "10uF,25V" H 9125 3800 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:TantalC_SizeA_EIA-3216_HandSoldering" H 9100 3900 60  0001 C CNN
F 3 "" H 9100 3900 60  0000 C CNN
	1    9100 3900
	1    0    0    -1  
$EndComp
$Comp
L CP1 C13
U 1 1 561F11CF
P 10400 3750
F 0 "C13" H 10425 3850 50  0000 L CNN
F 1 "100uF,50V" H 10425 3650 50  0000 L CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02" H 10400 3750 60  0001 C CNN
F 3 "" H 10400 3750 60  0000 C CNN
	1    10400 3750
	1    0    0    -1  
$EndComp
Text GLabel 8600 3700 0    60   Input ~ 0
5V
Text GLabel 10600 3350 2    60   Input ~ 0
EXT_V
$Comp
L CONN_01X02 P15
U 1 1 561F94FA
P 8750 3900
F 0 "P15" V 8850 3900 50  0000 C CNN
F 1 "JP EXT_V" V 8925 3875 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02" V 8750 3900 60  0001 C CNN
F 3 "" H 8750 3900 60  0000 C CNN
	1    8750 3900
	0    1    1    0   
$EndComp
Text GLabel 9200 3150 0    60   Input ~ 0
GND
$Comp
L TLV1117 U10
U 1 1 561F11B8
P 9750 3700
F 0 "U10" H 10050 4000 60  0000 C CNN
F 1 "TLV1117" H 9750 3750 60  0000 C CNN
F 2 "VQFP44:SOT-223" H 9750 3550 60  0001 C CNN
F 3 "" H 9650 3250 60  0000 C CNN
F 4 "5V" H 9750 3650 60  0000 C CNN "Voltage"
	1    9750 3700
	1    0    0    -1  
$EndComp
NoConn ~ 7400 4100
NoConn ~ 7400 4200
NoConn ~ 7400 3550
NoConn ~ 7400 3650
NoConn ~ 7400 3750
NoConn ~ 5600 4150
NoConn ~ 5600 4250
NoConn ~ 5600 4350
NoConn ~ 5600 4450
NoConn ~ 5600 3950
Text GLabel 8050 5550 2    60   Input ~ 0
EXT_V
Text GLabel 8050 5650 2    60   Input ~ 0
GND
Text GLabel 8050 6250 2    60   Input ~ 0
GND
$Comp
L motor_driver_carrier U14
U 1 1 5622021E
P 7350 5900
F 0 "U14" H 7600 6500 60  0000 C CNN
F 1 "DRV8825_carrier" V 7350 5900 60  0000 C CNN
F 2 "VQFP44:DRV8825_carrier" H 7350 5350 60  0001 C CNN
F 3 "" H 6850 5700 60  0000 C CNN
	1    7350 5900
	1    0    0    -1  
$EndComp
Text GLabel 6650 6150 0    60   Input ~ 0
STP_A
Text GLabel 6650 6250 0    60   Input ~ 0
DIR_A
Text GLabel 8050 6150 2    60   Input ~ 0
5V
Text GLabel 6650 5550 0    60   Input ~ 0
ENABLE
$Comp
L CONN_01X04 P19
U 1 1 5622022C
P 8450 5900
F 0 "P19" H 8450 6150 50  0000 C CNN
F 1 "Motor A" V 8550 5900 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x04" H 8450 5900 60  0001 C CNN
F 3 "" H 8450 5900 60  0000 C CNN
	1    8450 5900
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X03 P17
U 1 1 56220237
P 6000 5750
F 0 "P17" H 6000 5550 50  0000 C CNN
F 1 "MicroStepJP A" H 6000 5950 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x03" H 6000 4550 60  0001 C CNN
F 3 "" H 6000 4550 60  0000 C CNN
	1    6000 5750
	-1   0    0    1   
$EndComp
Text GLabel 5750 5650 0    60   Input ~ 0
5V
Text GLabel 5750 5750 0    60   Input ~ 0
5V
Text GLabel 5750 5850 0    60   Input ~ 0
5V
$Comp
L PWR_FLAG #FLG011
U 1 1 56220244
P 6100 6050
F 0 "#FLG011" H 6100 6145 50  0001 C CNN
F 1 "PWR_FLAG" H 6100 6230 50  0000 C CNN
F 2 "" H 6100 6050 60  0000 C CNN
F 3 "" H 6100 6050 60  0000 C CNN
	1    6100 6050
	-1   0    0    1   
$EndComp
Text GLabel 5850 7000 1    60   Input ~ 0
EXT_V
Text GLabel 5850 7300 3    60   Input ~ 0
GND
$Comp
L CP1 C15
U 1 1 562239EE
P 5850 7150
F 0 "C15" H 5875 7250 50  0000 L CNN
F 1 "100uF,50V" H 5650 6700 50  0000 L CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02" H 5850 7150 60  0001 C CNN
F 3 "" H 5850 7150 60  0000 C CNN
	1    5850 7150
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X03 P16
U 1 1 56226469
P 9300 6150
F 0 "P16" H 9300 6350 50  0000 C CNN
F 1 "Clone STP" H 9300 5950 50  0000 C CNN
F 2 "" H 9300 4950 60  0000 C CNN
F 3 "" H 9300 4950 60  0000 C CNN
	1    9300 6150
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X03 P18
U 1 1 56226512
P 10300 6150
F 0 "P18" H 10300 6350 50  0000 C CNN
F 1 "Clone DIR" H 10300 5950 50  0000 C CNN
F 2 "" H 10300 4950 60  0000 C CNN
F 3 "" H 10300 4950 60  0000 C CNN
	1    10300 6150
	1    0    0    -1  
$EndComp
Text GLabel 9600 5950 1    60   Input ~ 0
STP_A
Text GLabel 10000 5950 1    60   Input ~ 0
DIR_A
Text GLabel 9050 6250 0    60   Input ~ 0
STP_X
Text GLabel 9050 6150 0    60   Input ~ 0
STP_Y
Text GLabel 9050 6050 0    60   Input ~ 0
STP_Z
Text GLabel 10550 6050 2    60   Input ~ 0
DIR_X
Text GLabel 10550 6150 2    60   Input ~ 0
DIR_Y
Text GLabel 10550 6250 2    60   Input ~ 0
DIR_Z
Text GLabel 9700 2950 1    60   Input ~ 0
POWER
$Comp
L CONN_02X05 P20
U 1 1 5626F880
P 1400 5375
F 0 "P20" H 1400 5675 50  0000 C CNN
F 1 "PoStep25-32  A" H 1400 5075 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x05" H 1400 4975 60  0001 C CNN
F 3 "" H 1400 4175 60  0000 C CNN
	1    1400 5375
	1    0    0    -1  
$EndComp
Text GLabel 1150 5175 0    60   Input ~ 0
ENABLE
Text GLabel 1150 5275 0    60   Input ~ 0
DIR_A
Text GLabel 1150 5375 0    60   Input ~ 0
STP_A
Text GLabel 1650 5175 2    60   Input ~ 0
GND
Text GLabel 1650 5275 2    60   Input ~ 0
GND
Text GLabel 1650 5375 2    60   Input ~ 0
GND
Text GLabel 1650 5475 2    60   Input ~ 0
GND
Text GLabel 1650 5575 2    60   Input ~ 0
GND
NoConn ~ 1150 5575
Text GLabel 1150 5475 0    60   Input ~ 0
LIMIT_A
$Comp
L CONN_02X03 P21
U 1 1 56273B14
P 1400 6075
F 0 "P21" H 1400 6275 50  0000 C CNN
F 1 "Clone LIMIT" H 1400 5875 50  0000 C CNN
F 2 "" H 1400 4875 60  0000 C CNN
F 3 "" H 1400 4875 60  0000 C CNN
	1    1400 6075
	1    0    0    -1  
$EndComp
Text GLabel 1750 5975 2    60   Input ~ 0
LIMIT_A
Wire Wire Line
	6800 4500 6600 4500
Wire Wire Line
	6800 4350 6600 4350
Wire Wire Line
	6800 4200 6600 4200
Wire Wire Line
	6800 4050 6600 4050
Wire Wire Line
	6800 3900 6600 3900
Wire Wire Line
	6800 3750 6600 3750
Wire Wire Line
	6800 3500 6600 3500
Wire Wire Line
	6800 3350 6600 3350
Wire Wire Line
	6750 3200 6550 3200
Wire Wire Line
	6750 3050 6550 3050
Wire Wire Line
	6750 2900 6550 2900
Wire Wire Line
	9400 1450 9400 1300
Wire Wire Line
	9400 1300 9450 1300
Wire Wire Line
	8050 1400 8150 1400
Wire Wire Line
	8150 1400 8150 1450
Wire Wire Line
	3550 6050 3350 6050
Wire Wire Line
	3350 6050 3350 6150
Wire Wire Line
	3000 6150 3550 6150
Wire Wire Line
	4950 5850 5150 5850
Wire Wire Line
	4950 5950 5150 5950
Wire Wire Line
	4950 6050 5150 6050
Wire Wire Line
	4950 6150 5150 6150
Wire Wire Line
	1700 7225 1500 7225
Wire Wire Line
	1500 7225 1500 7325
Wire Wire Line
	1150 7325 1700 7325
Wire Wire Line
	3100 7025 3300 7025
Wire Wire Line
	3100 7125 3300 7125
Wire Wire Line
	3100 7225 3300 7225
Wire Wire Line
	3100 7325 3300 7325
Wire Wire Line
	1300 7025 1700 7025
Wire Wire Line
	9200 5050 9000 5050
Wire Wire Line
	9000 5050 9000 5150
Wire Wire Line
	8650 5150 9200 5150
Wire Wire Line
	10600 4850 10800 4850
Wire Wire Line
	10600 4950 10800 4950
Wire Wire Line
	10600 5050 10800 5050
Wire Wire Line
	10600 5150 10800 5150
Wire Wire Line
	8800 4850 9200 4850
Connection ~ 3350 6150
Connection ~ 9000 5150
Connection ~ 1500 7325
Wire Wire Line
	10350 3600 10400 3600
Wire Wire Line
	8800 3700 9100 3700
Wire Wire Line
	9100 3700 9100 3750
Wire Wire Line
	8600 3700 8700 3700
Wire Wire Line
	10400 3600 10400 3150
Wire Wire Line
	10400 3150 10200 3150
Wire Wire Line
	9700 2950 9700 3150
Wire Wire Line
	9700 3150 9600 3150
Wire Wire Line
	6650 5950 6450 5950
Wire Wire Line
	6450 5950 6450 6050
Wire Wire Line
	6100 6050 6650 6050
Wire Wire Line
	8050 5750 8250 5750
Wire Wire Line
	8050 5850 8250 5850
Wire Wire Line
	8050 5950 8250 5950
Wire Wire Line
	8050 6050 8250 6050
Connection ~ 6450 6050
Wire Wire Line
	9600 6250 9550 6250
Wire Wire Line
	9600 5950 9600 6250
Wire Wire Line
	9550 6050 9600 6050
Connection ~ 9600 6050
Wire Wire Line
	9550 6150 9600 6150
Connection ~ 9600 6150
Wire Wire Line
	10000 5950 10000 6250
Wire Wire Line
	10000 6250 10050 6250
Wire Wire Line
	10050 6150 10000 6150
Connection ~ 10000 6150
Wire Wire Line
	10050 6050 10000 6050
Connection ~ 10000 6050
Wire Wire Line
	3150 5750 3550 5750
Wire Wire Line
	3150 5950 3550 5950
Wire Wire Line
	1300 6925 1700 6925
Wire Wire Line
	1300 7125 1700 7125
Wire Wire Line
	6250 5750 6650 5750
Wire Wire Line
	6250 5650 6650 5650
Wire Wire Line
	6250 5850 6650 5850
Wire Wire Line
	8800 4750 9200 4750
Wire Wire Line
	8800 4950 9200 4950
Wire Wire Line
	10600 3350 10400 3350
Connection ~ 10400 3350
Wire Wire Line
	1650 5975 1750 5975
Wire Wire Line
	1700 5975 1700 6175
Wire Wire Line
	1700 6175 1650 6175
Connection ~ 1700 5975
Wire Wire Line
	1650 6075 1700 6075
Connection ~ 1700 6075
Text GLabel 1150 5975 0    60   Input ~ 0
LIMIT_Z
Text GLabel 1150 6075 0    60   Input ~ 0
LIMIT_Y
Text GLabel 1150 6175 0    60   Input ~ 0
LIMIT_X
Wire Wire Line
	3150 5850 3550 5850
Text Notes 3625 1375 0    60   ~ 0
RX1
Text Notes 4275 1375 0    60   ~ 0
RX2
Text Notes 4925 1375 0    60   ~ 0
RX3
Text Notes 5625 1375 0    60   ~ 0
TX1
Text Notes 6300 1375 0    60   ~ 0
TX2
Text Notes 6925 1375 0    60   ~ 0
TX3
Text Notes 3950 2725 0    60   ~ 0
CPLD
Text Notes 8700 2675 0    60   ~ 0
CLK for CPLD
Text Notes 4150 7150 0    60   ~ 0
Voltage Spikes Protection
Text Notes 4150 7400 0    60   ~ 0
Place near each DRV8825\ncarrier VMOT pin.
Text Notes 1150 650  0    60   ~ 0
Decoupling Capacitors
Text Notes 850  1725 0    60   ~ 0
Decoupling Capacitors
$EndSCHEMATC
