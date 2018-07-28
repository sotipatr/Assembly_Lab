.arm
.text
.global main
main:
STMDB R13!,{R0-R12}
LDR R1,=Values
LDR R0,[R1]
BL Subrtn
MOV PC,R14
Subrtn:
STMDB R13!,{R0-R12}
LDR R9,=Result
LDR R3,=Const
MOV R10,#0x0
Loop1:
MOV R8,#0x0
LDRB R4,[R3,#6]!
Loop2:
SUB R3,R3,#1
LDRB R2,[R3]
MUL R7,R0,R4

ADD R7,R7,R2
MOV R4,R7
ADD R8,R8,#1
CMP R8,#6
BNE Loop2

STR R4,[R9],#4
ADD R10,R10,#1
LDR R0,[R1,#4]!
CMP R10,#4
BNE Loop1
end:


LDMIA R13!,{R0-R12}
MOV PC ,LR

.data
.align 4
Values:
.word 0x10
.word 0x50A
.word 0xCDCA
.word 0x80AB
Const:
.byte 0x04,0x07,0x05
.byte 0x20,0x1A,0x12,0x06
Result:
.word 0,0,0,0

