.arm
.text
.global main
main:
STMDB R13!, {R0-R12, R14}
LDR R0,=Values
LDR R8,=Const
LDR R9,=Results
MOV R6,#0
MOV R7,#0
MOV R5,#0
BL Subrtn
SUB R8,R8,#3
BL Subrtn
SUB R8,R8,#3
BL Subrtn
SUB R8,R8,#3
BL Subrtn
end:
LDMIA R13!,{R0-R12,R14}
MOV PC,R14

Subrtn:
STMDB R13!, {R1-R7}
LDRB R1,[R0],#1
LDRB R2,[R0],#1
LDRB R3,[R0],#1
LDRB R4,[R8],#1
MUL R6,R1,R4
LDRB R4,[R8],#1
MUL R7,R2,R4
LDRB R4,[R8],#1
MUL R1,R3,R4
ADD R6,R6,R7
MOV R7,#5
SUB R6,R6,R1
MUL R5,R6,R7
MOV R5,R5,LSR #6
STRB R5,[R9]
ADD R9,R9,#1
bla:
LDMIA R13!,{R1-R7}
MOV PC,LR

.data
Values:
.byte 0x02, 0x03, 0x04
.byte 0x10, 0x05, 0x06
.byte 0x0B, 0x02, 0x0D
.byte 0x01, 0x0C, 0x08
Const:
.byte 0x04, 0x07, 0x05
Results:
.byte 0,0,0,0
