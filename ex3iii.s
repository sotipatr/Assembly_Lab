.arm

.text

.global main


main:

STMDB R13!, {R0-R12, R14}


LDR R0, =Stor

MOV R1,#1
STRB R1, [R0], #1
MOV R2,#2
STRB R2, [R0], #1
MOV R3,#0
ADD R4, R0,#4



Loop:

ADD R3,R1,R2

STRB R3, [R0], #1

MOV R1,R2
MOV R2,R3
CMP R0,R4
BLO Loop



LDMIA R13!, {R0-R12, R14}
MOV PC, R14


.data

Stor:

.byte 0
.byte 0
.byte 0
.byte 0
.byte 0
.byte 0

