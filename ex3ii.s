.arm

.text

.global main
main:

STMDB R13!, {R0-R12, R14}

LDR R0, =Stor

MOV R1,#0


Loop:
STRB R1, [R0], #1
ADD R1, R1, #1

CMP R1, #5 
BLS Loop



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
