!--------------------------------------------------
!- Samstag, 2. November 2019 17:50:44
!- Import of : 
!- e:\_c64\rpsls\rpsls\rpsls01.prg
!- Commodore 64
!--------------------------------------------------
10 REM ROCK PAPER SCISSOR LIZARD SPOCK
15 PRINT CHR$(147):POKE 53280,6:POKE 53281,6
20 PRINT"rock paper scissor lizard spock":print:print
21 V=53248:FORX=0TO7:POKE2040+X,200:POKEV+39+X,1:NEXT:REM memory location for sprites
22 FOR X=0TO62:READA:POKE12288+X,a:NEXT:REM definition of sprites
23 FOR X=64TO126:READA:POKE12288+X,a:NEXT
24 FOR X=128TO190:READA:POKE12288+X,a:NEXT
25 FOR X=192TO254:READA:POKE12288+X,a:NEXT 
26 FOR X=256TO318:READA:POKE12288+X,a:NEXT
27 FOR X=320TO382:READA:POKE12288+X,a:NEXT
28 FOR X=384TO446:READA:POKE12288+X,a:NEXT
29 FOR X=448TO510:READA:POKE12288+X,a:NEXT
30 FOR X=512TO574:POKE12288+X,0:NEXT:REM empty sprite
35 INPUT"no of players:";N
40 FORX=0TON-1
50 PRINTX+1;:PRINT". ";:INPUT"name ";N$(X)
60 NEXT

100 GOSUB 5000
300 REM place sprites
310 POKEV+21,255:REM visibility
320 FORx=0TO7:POKEV+39+x,1:NEXT:REM color
330 REM position of sign sprites
340 POKEV,148:POKEV+1,91
350 POKEV+2,148:POKEV+3,124
360 POKEV+4,148:POKEV+5,155
370 POKEV+6,195:POKEV+7,91
380 POKEV+8,195:POKEV+9,124
390 POKEV+10,195:POKEV+11,155
400 REM position and size of count sprite
410 POKEV+12,160:POKEV+13,110:POKEV+29,64:POKEv+23,64

420 REM GOING THRU THE PLAYERS
430 Z=0:O1=99:O2=99
440 IFN(Z)=0THENO1=Z:Z=Z+1:GOTO450
445 Z=Z+1:IFZ<N-1GOTO440
450 IFN(Z)=0THENO2=Z:GOTO465
460 Z=Z+1:IFZ<N-1GOTO450
462 IFZ>NGOTO475
465 IFO1=99 OR O2=99GOTO475
470 PY=10:PX=1:GOSUB3000:PRINTN$(O1):PX=26:GOSUB3000:PRINTN$(O2)
472 GOTO500
475 REM NEXT ROUND
476 FORX=0TON-1STEP2:PRINTN(X),N(X+1):NEXT

499 END
500 REM the battle
510 LP=0:P1=0:P2=0
520 POKE2046,197:FORY=0TO2:FORX=0TO300:NEXT:POKE2046,198+Y:NEXT
530 GOSUB3100:R1=R:GOSUB3100:R2=R
540 POKE2040+LP,192+R1:POKE2043+LP,192+R2
550 IFR1<>R2THENLP=LP+1
551 IFR1=0 AND R2=2 OR R1=0 AND R2=3 THEN P1=P1+1:POKEV+LP+38,5:POKEV+LP+41,2
552 IFR1=1 AND R2=0 OR R1=1 AND R2=4 THEN P1=P1+1:POKEV+LP+38,5:POKEV+LP+41,2
553 IFR1=2 AND R2=1 OR R1=2 AND R2=3 THEN P1=P1+1:POKEV+LP+38,5:POKEV+LP+41,2
554 IFR1=3 AND R2=1 OR R1=3 AND R2=4 THEN P1=P1+1:POKEV+LP+38,5:POKEV+LP+41,2
555 IFR1=4 AND R2=0 OR R1=4 AND R2=2 THEN P1=P1+1:POKEV+LP+38,5:POKEV+LP+41,2
556 IFR2=0 AND R1=2 OR R2=0 AND R1=3 THEN P2=P2+1:POKEV+LP+41,5:POKEV+LP+38,2
557 IFR2=1 AND R1=0 OR R2=1 AND R1=4 THEN P2=P2+1:POKEV+LP+41,5:POKEV+LP+38,2
558 IFR2=2 AND R1=1 OR R2=2 AND R1=3 THEN P2=P2+1:POKEV+LP+41,5:POKEV+LP+38,2
559 IFR2=3 AND R1=1 OR R2=3 AND R1=4 THEN P2=P2+1:POKEV+LP+41,5:POKEV+LP+38,2
560 IFR2=4 AND R1=0 OR R2=4 AND R1=2 THEN P2=P2+1:POKEV+LP+41,5:POKEV+LP+38,2
565 IFLP<3THENFORX=0TO300:NEXT:GOTO520
566 PRINT P1, P2
568 IFP1>P2THENN(O1)=2:N(O2)=1
569 IFP2>P1THENN(O2)=2:N(O1)=1
570 FORX=0TO300:NEXT:FORX=0to5:POKE2040+X,200:POKEV+39+X,1:NEXT:GOTO 430: REM test loop

998 GOTO 998
999 END
1000 REM STONE
1020 DATA 0,0,0
1030 DATA 0,0,0
1040 DATA 0,0,0
1050 DATA 0,31,128
1060 DATA 0,243,224
1070 DATA 3,228,240
1080 DATA 7,176,56
1090 DATA 14,142,236
1100 DATA 30,241,156
1110 DATA 27,24,118
1120 DATA 57,199,58
1130 DATA 62,102,110
1140 DATA 57,153,186
1150 DATA 61,85,126
1160 DATA 26,170,188
1170 DATA 30,245,220
1180 DATA 15,183,248
1190 DATA 7,109,240
1200 DATA 1,234,224
1210 DATA 0,255,128
1220 DATA 0,0,0
1230 REM PAPER
1240 DATA 0,0,0
1250 DATA 0,0,0
1260 DATA 7,255,248
1270 DATA 8,0,36
1280 DATA 19,174,66
1290 DATA 16,0,66
1300 DATA 9,219,36
1310 DATA 4,0,56
1320 DATA 4,182,160
1330 DATA 4,0,32
1340 DATA 2,238,208
1350 DATA 2,0,16
1360 DATA 2,117,144
1370 DATA 1,0,8
1380 DATA 7,255,232
1390 DATA 8,0,68
1400 DATA 16,0,132
1410 DATA 16,0,132
1420 DATA 8,0,72
1430 DATA 7,255,240
1440 DATA 0,0,0

1460 REM SCISSOR
1470 DATA 0,0,0
1480 DATA 48,0,12
1490 DATA 56,0,28
1500 DATA 28,0,56
1510 DATA 14,0,112
1520 DATA 7,0,224
1530 DATA 3,129,192
1540 DATA 1,195,128
1550 DATA 0,231,0
1560 DATA 0,126,0
1570 DATA 0,60,0
1580 DATA 0,60,0
1590 DATA 0,126,0
1600 DATA 0,231,0
1610 DATA 1,195,128
1620 DATA 3,129,192
1630 DATA 15,0,240
1640 DATA 18,0,72
1650 DATA 34,0,68
1660 DATA 36,0,36
1670 DATA 24,0,24

1690 REM LIZARD
1700 DATA 0,0,0
1710 DATA 0,12,30
1720 DATA 0,30,50
1730 DATA 0,12,34
1740 DATA 0,4,102
1750 DATA 0,7,252
1760 DATA 0,6,176
1770 DATA 0,13,98
1780 DATA 0,26,167
1790 DATA 2,53,111
1800 DATA 7,42,250
1810 DATA 7,116,192
1820 DATA 3,203,128
1830 DATA 0,87,0
1840 DATA 0,255,0
1850 DATA 0,227,112
1860 DATA 65,193,240
1870 DATA 65,128,96
1880 DATA 99,0,0
1890 DATA 62,0,0
1900 DATA 0,0,0

1920 REM SPOCK
1930 DATA 0,1,128
1940 DATA 1,130,112
1950 DATA 2,130,80
1960 DATA 2,130,144
1970 DATA 6,68,144
1980 DATA 10,68,160
1990 DATA 9,69,32
2000 DATA 9,41,32
2010 DATA 5,41,64
2020 DATA 4,170,64
2030 DATA 4,146,64
2040 DATA 4,0,134
2050 DATA 4,0,138
2060 DATA 4,0,146
2070 DATA 4,0,164
2080 DATA 4,0,68
2090 DATA 2,0,8
2100 DATA 2,0,16
2110 DATA 1,0,32
2120 DATA 1,0,64
2130 DATA 1,0,128

2150 REM NUMBERS
2160 DATA 3,255,192
2170 DATA 7,255,224
2180 DATA 7,255,224
2190 DATA 7,0,224
2200 DATA 0,0,224
2210 DATA 0,0,224
2220 DATA 0,0,224
2230 DATA 0,0,224
2240 DATA 0,0,224
2250 DATA 0,31,224
2260 DATA 0,31,224
2270 DATA 0,31,224
2280 DATA 0,3,224
2290 DATA 0,3,224
2300 DATA 0,3,224
2310 DATA 0,3,224
2320 DATA 0,3,224
2330 DATA 7,3,224
2340 DATA 7,255,224
2350 DATA 7,255,224
2360 DATA 3,255,192
2380 REM 
2390 DATA 3,255,192
2400 DATA 7,255,224
2410 DATA 7,255,224
2420 DATA 7,0,224
2430 DATA 0,0,224
2440 DATA 0,0,224
2450 DATA 0,0,224
2460 DATA 0,0,224
2470 DATA 0,0,224
2480 DATA 3,255,224
2490 DATA 7,255,224
2500 DATA 7,255,192
2510 DATA 7,0,0
2520 DATA 7,0,0
2530 DATA 7,0,0
2540 DATA 7,0,0
2550 DATA 7,3,224
2560 DATA 7,3,224
2570 DATA 7,255,224
2580 DATA 7,255,224
2590 DATA 3,255,192
2610 REM 
2620 DATA 0,7,192
2630 DATA 0,15,224
2640 DATA 0,15,224
2650 DATA 0,0,224
2660 DATA 0,0,224
2670 DATA 0,0,224
2680 DATA 0,0,224
2690 DATA 0,0,224
2700 DATA 0,0,224
2710 DATA 0,3,224
2720 DATA 0,3,224
2730 DATA 0,3,224
2740 DATA 0,3,224
2750 DATA 0,3,224
2760 DATA 0,3,224
2770 DATA 0,3,224
2780 DATA 0,3,224
2790 DATA 0,3,224
2800 DATA 0,3,224
2810 DATA 0,3,224
2820 DATA 0,3,192
2999 END
3000 REM CURSOR PLACEMENT
3010 POKE780,0:POKE781,PY:POKE782,PX:SYS65520:RETURN
3100 REM RANDOM NUMBER
3110 POKE54286,RND(0)*255:POKE54287,RND(0)*255
3120 POKE54291,97:POKE54292,200:POKE54290,129:POKE54296,0
3130 R=INT(PEEK(54299)/52):IFR=5GOTO3110
3140 RETURN

5000 REM SCREEN 1 - 
5010 PRINT "{cyan}UCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCI";
5020 PRINT "B                                      B";
5030 PRINT "B   rock paper scissor lizzard spock   B";
5040 PRINT "B                                      B";
5050 PRINT "{171}CCCCCCCCCCCCC{178}CCCC{178}{178}CCCC{178}CCCCCCCCCCCCC{179}";
5060 PRINT "Bplayer 1     B    BB    Bplayer 2     B";
5070 PRINT "{171}CCCCCCCCCCCCC{179}    BB    {171}CCCCCCCCCCCCC{179}";
5080 PRINT "B             B    BB    B             B";
5090 PRINT "B             {171}CCCC{179}{171}CCCC{179}             B";
5100 PRINT "B             B    BB    B             B";
5110 PRINT "B             B    BB    B             B";
5120 PRINT "B             B    BB    B             B";
5130 PRINT "B             {171}CCCC{179}{171}CCCC{179}             B";
5140 PRINT "B             B    BB    B             B";
5150 PRINT "B             B    BB    B             B";
5160 PRINT "B             B    BB    B             B";
5170 PRINT "{171}CCCCCCCCCCCCC{177}CCCC{177}{177}CCCC{177}CCCCCCCCCCCCC{179}";
5180 PRINT "B                                      B";
5190 PRINT "B                                      B";
5200 PRINT "B                                      B";
5210 PRINT "B                                      B";
5220 PRINT "B                                      B";
5230 PRINT "B                                      B";
5240 REM PRINT "B                                      B";
5250 PRINT "JCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCK";
5255 RW=0:CL=0:GOSUB3000
5260 RETURN
