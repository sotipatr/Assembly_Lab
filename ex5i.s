.arm
.text
.global main
main:
STMDB R13!, {R0-R12}
LDR R0, =table
BL Subrtn1
LDMIA R13!,{R0-R12}
MOV PC,R14

Subrtn1:
STMDB R13!,{R2-R12}
MOV R1,#6
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
CMP R7,#5
BLO Loop1
end:
LDMIA R13!,{R2-R12}
MOV PC,R14


.data
table:
.byte 0x45
.byte 0x82
.byte 0x34
.byte 0xDA
.byte 0x10
.byte 0x28
