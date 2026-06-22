.section .text
.globl _start
_start:
    lui x1, 0x10000
    addi x1, x1, 1
    sw x1, 0(x2)
