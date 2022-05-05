EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_UNO_R3 A?
U 1 1 61A0E236
P 5200 3350
F 0 "A?" H 5200 4531 50  0000 C CNN
F 1 "Arduino_UNO_R3" H 5200 4440 50  0000 C CNN
F 2 "Module:Arduino_UNO_R3" H 5200 3350 50  0001 C CIN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 5200 3350 50  0001 C CNN
	1    5200 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3000 6900 3000
Wire Wire Line
	6950 2900 6050 2900
Wire Wire Line
	6050 2900 6050 2150
Wire Wire Line
	6050 2150 4500 2150
Wire Wire Line
	4500 2150 4500 2950
Wire Wire Line
	4500 2950 4700 2950
$Comp
L Valve:coin_acceptor U?
U 1 1 6273A8A1
P 7100 2800
F 0 "U?" H 7600 2600 50  0001 C CNN
F 1 "coin_acceptor" H 7419 2615 50  0000 L CNN
F 2 "" H 7600 2600 50  0001 C CNN
F 3 "" H 7600 2600 50  0001 C CNN
	1    7100 2800
	1    0    0    -1  
$EndComp
$Comp
L Valve:power12V U?
U 1 1 6273C381
P 7600 2300
F 0 "U?" H 7600 2300 50  0001 C CNN
F 1 "power12V" H 7600 2333 50  0000 C CNN
F 2 "" H 7600 2300 50  0001 C CNN
F 3 "" H 7600 2300 50  0001 C CNN
	1    7600 2300
	1    0    0    -1  
$EndComp
$Comp
L power:AC #PWR?
U 1 1 6273F93C
P 8250 2400
F 0 "#PWR?" H 8250 2300 50  0001 C CNN
F 1 "AC" H 8250 2675 50  0000 C CNN
F 2 "" H 8250 2400 50  0001 C CNN
F 3 "" H 8250 2400 50  0001 C CNN
	1    8250 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2400 6700 2400
Wire Wire Line
	6700 2400 6700 1750
Wire Wire Line
	6700 1750 5100 1750
Wire Wire Line
	5100 1750 5100 2350
Wire Wire Line
	7350 2600 6500 2600
Wire Wire Line
	6500 2600 6500 3000
Wire Wire Line
	6500 3000 6500 3550
Wire Wire Line
	6500 4450 5300 4450
Connection ~ 6500 3000
Wire Wire Line
	6900 3100 6700 3100
Wire Wire Line
	6700 3100 6700 2400
Connection ~ 6700 2400
Wire Wire Line
	8250 2400 7850 2400
Wire Wire Line
	8400 2600 7850 2600
$Comp
L Valve:relay5V U?
U 1 1 627430A5
P 3050 3200
F 0 "U?" H 3050 3200 50  0001 C CNN
F 1 "small field relay" H 3075 3233 50  0000 C CNN
F 2 "" H 3050 3200 50  0001 C CNN
F 3 "" H 3050 3200 50  0001 C CNN
	1    3050 3200
	1    0    0    -1  
$EndComp
$Comp
L Valve:relay5V U?
U 1 1 62744315
P 3050 4000
F 0 "U?" H 3050 4000 50  0001 C CNN
F 1 "big field relay" H 3075 4033 50  0000 C CNN
F 2 "" H 3050 4000 50  0001 C CNN
F 3 "" H 3050 4000 50  0001 C CNN
	1    3050 4000
	1    0    0    -1  
$EndComp
$Comp
L Valve:TM1637display U?
U 1 1 62744F83
P 6050 4900
F 0 "U?" H 6050 4900 50  0001 C CNN
F 1 "TM1637display" H 6228 4665 50  0000 L CNN
F 2 "" H 6050 4900 50  0001 C CNN
F 3 "" H 6050 4900 50  0001 C CNN
	1    6050 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 5000 5300 5000
Wire Wire Line
	5300 5000 5300 4450
Connection ~ 5300 4450
Wire Wire Line
	5750 5100 5750 5000
Wire Wire Line
	5750 4750 5900 4750
Wire Wire Line
	5900 4750 5900 2350
Wire Wire Line
	5900 2350 5400 2350
Connection ~ 5750 5000
Wire Wire Line
	5750 5000 5750 4750
Wire Wire Line
	5750 5200 4500 5200
Wire Wire Line
	4500 5200 4500 3050
Wire Wire Line
	4500 3050 4700 3050
Wire Wire Line
	5750 5300 4400 5300
Wire Wire Line
	4400 5300 4400 3150
Wire Wire Line
	4400 3150 4700 3150
Wire Wire Line
	4700 3550 3850 3550
Wire Wire Line
	3850 3550 3850 3450
Wire Wire Line
	3850 3450 3350 3450
Wire Wire Line
	4700 3650 3850 3650
Wire Wire Line
	3850 3650 3850 4250
Wire Wire Line
	3850 4250 3350 4250
Wire Wire Line
	3350 3600 3350 3900
Wire Wire Line
	3350 3900 4150 3900
Wire Wire Line
	4150 3900 4150 4400
Wire Wire Line
	4150 4450 5100 4450
Wire Wire Line
	3350 4400 4150 4400
Connection ~ 4150 4400
Wire Wire Line
	4150 4400 4150 4450
Wire Wire Line
	3350 4100 3600 4100
Wire Wire Line
	3600 4100 3600 3300
Wire Wire Line
	3600 2250 5400 2250
Wire Wire Line
	5400 2250 5400 2350
Connection ~ 5400 2350
Wire Wire Line
	3350 3300 3600 3300
Connection ~ 3600 3300
Wire Wire Line
	3600 3300 3600 2250
$Comp
L Switch:SW_SPST SW?
U 1 1 6274C687
P 3050 2800
F 0 "SW?" H 3050 3035 50  0001 C CNN
F 1 "Big field button" H 3050 2943 50  0000 C CNN
F 2 "" H 3050 2800 50  0001 C CNN
F 3 "~" H 3050 2800 50  0001 C CNN
	1    3050 2800
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW?
U 1 1 6274E312
P 3050 2350
F 0 "SW?" H 3050 2585 50  0001 C CNN
F 1 "Small field Button" H 3050 2493 50  0000 C CNN
F 2 "" H 3050 2350 50  0001 C CNN
F 3 "~" H 3050 2350 50  0001 C CNN
	1    3050 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2800 3250 3050
Wire Wire Line
	3250 3050 4250 3050
Wire Wire Line
	4250 3050 4250 3350
Wire Wire Line
	4250 3350 4700 3350
Wire Wire Line
	3250 2350 4300 2350
Wire Wire Line
	4300 2350 4300 3250
Wire Wire Line
	4300 3250 4700 3250
Wire Wire Line
	2850 2800 2850 3150
Wire Wire Line
	2850 3150 4150 3150
Wire Wire Line
	4150 3150 4150 3900
Connection ~ 4150 3900
Wire Wire Line
	2850 2350 2850 2800
Connection ~ 2850 2800
$Comp
L Valve:coin_acceptor U?
U 1 1 62754BA4
P 7100 3350
F 0 "U?" H 7600 3150 50  0001 C CNN
F 1 "coin_acceptor" H 7419 3165 50  0000 L CNN
F 2 "" H 7600 3150 50  0001 C CNN
F 3 "" H 7600 3150 50  0001 C CNN
	1    7100 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 3550 6500 3550
Connection ~ 6500 3550
Wire Wire Line
	6500 3550 6500 4450
Wire Wire Line
	6900 3650 6700 3650
Wire Wire Line
	6700 3650 6700 3100
Connection ~ 6700 3100
Wire Wire Line
	6950 3450 6250 3450
Wire Wire Line
	6250 3450 6250 4600
Wire Wire Line
	6250 4600 4600 4600
Wire Wire Line
	4600 4600 4600 3450
Wire Wire Line
	4600 3450 4700 3450
$Comp
L power:Earth #PWR?
U 1 1 627611C0
P 8400 2600
F 0 "#PWR?" H 8400 2350 50  0001 C CNN
F 1 "Earth" H 8400 2450 50  0001 C CNN
F 2 "" H 8400 2600 50  0001 C CNN
F 3 "~" H 8400 2600 50  0001 C CNN
	1    8400 2600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
