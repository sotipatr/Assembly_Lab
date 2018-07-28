.arm
.text
.global main
main:
STMDB R13!, {R0-R12}
LDR R0, =arr1
LDR R1, =arr2
LDR R5, =arr3
LDRB R2, [R0, #0]!
LDRB R3, [R1, #0]!
ADD R4, R3, R2
STRB R4, [R5]
ADD R7, R0, #15

Loop:
LDRB R2, [R0, #1]!
LDRB R3, [R1, #1]!
ADD R4, R3, R2
STRB R4, [R5, #1]!
CMP R0, R7
BLO Loop

LDMIA R13!, {R0-R12}
MOV PC, R14
.data
arr1:
.byte 0x20, 0x7F, 0xFE, 0x39, 0x16, 0x6F, 0x30, 0xB, 0x57, 0x2D, 0x72, 0x2D, 0x42, 0x17, 0x86, 0xA8
arr2:
.byte 0x13, 0x1, 0x12, 0x59, 0x5A, 0x70, 0x59, 0x20, 0x17, 0x62, 0x43, 0x53, 0x92, 0x8C, 0xC8, 0x43
arr3:
.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0