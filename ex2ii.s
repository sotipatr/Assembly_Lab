.arm
.text
.global main
main:
STMDB R13!, {R0-R12}
LDR R0, =arr1
LDR R1, =arr2
LDR R5, =arr3
LDRH R2, [R0, #0]!
LDRH R3, [R1, #0]!
ADD R4, R3, R2
STRH R4, [R5]
ADD R7, R0, #15

Loop:
LDRH R2, [R0, #2]!
LDRH R3, [R1, #2]!
ADD R4, R3, R2
STRH R4, [R5, #2]!
CMP R0, R7
BLO Loop

LDMIA R13!, {R0-R12}
MOV PC, R14
.data
arr1:
.hword 0x7F20, 0x39FE, 0x6F16, 0xB30, 0x2D57, 0x2D72, 0x1742, 0xA886
arr2:
.hword 0x113, 0x5912, 0x705A, 0x2059, 0x6217, 0x5343, 0x8C92, 0x43C8
arr3:
.hword 0, 0, 0, 0, 0, 0, 0, 0