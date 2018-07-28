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
ADC R4, R3, R2
STRH R4, [R5]
ADD R7, R0, #15

Loop:
LDRH R2, [R0, #4]!
LDRH R3, [R1, #4]!
ADC R4, R3, R2
STRH R4, [R5, #4]!
CMP R0, R7
BLO Loop

LDMIA R13!, {R0-R12}
MOV PC, R14
.data
arr1:
.word 0x39FE7F20, 0xB306F16, 0x2D722D57, 0xA8861742
arr2:
.word 0x5912113, 0x2059705A, 0x53436217, 0x43C88C92
arr3:
.word 0, 0, 0, 0