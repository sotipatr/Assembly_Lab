.arm
.text
.global main
main:
STMDB R13!, {R0-R12}
LDR R0, =table
BL Subrtn1
LDR R0, =table
BL Subrtn2
end:
LDMIA R13!,{R0-R12}
MOV PC,R14

Subrtn1:
STMDB R13!,{R2-R12}
MOV R1,#20
MOV R7,#0

Loop1:
ADD R3,R7,#1
LDRB R6,[R0,R7]
MOV R2,R7

Loop2:
LDRB R4,[R0,R3]
CMP R6,R4
MOVHI R2,R3
MOVHI R6,R4
ADD R3,R3,#1
CMP R3,R1
BLO Loop2

LDRB R5,[R0,R7]
STRB R6,[R0,R7]
STRB R5,[R0,R2]
ADD R7,R7,#1
CMP R7,#19
BLO Loop1

LDMIA R13!,{R2-R12}
MOV PC,R14

Subrtn2:
STMDB R13!,{R0-R12}
MOV R10,#0
MOV R11,#0
Loop3:
LDRB R8,[R0]
ADD R0,R0,#1
LDRB R9,[R0]
ADD R0,R0,#1
ADD R11,R11,#1
CMP R8, R9
MOVLO R10,R11
CMP R11,#19
BLO Loop3
end2:
LDMIA R13!,{R0-R12}
MOV PC,R14

.data
table:

.byte 0x13
.byte 0x07
.byte 0x04
.byte 0x09
.byte 0x11
.byte 0x0F
.byte 0x0D
.byte 0x0C
.byte 0x10
.byte 0x06
.byte 0x00
.byte 0x08
.byte 0x05
.byte 0x0A
.byte 0x01
.byte 0x0B
.byte 0x02
.byte 0x0E
.byte 0x12
.byte 0x03
