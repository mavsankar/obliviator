ldr r0,=InFile
mov r1,#0
swi 0x66
ldr r1,=InFileHandle
str r0,[r1]

ldr r1,=Read
mov r2,#80
swi 0x6a

loop:
cmp r0,#',
BNE jump
mov r0, #'\n
swi 0x00
jump:
ldrb r0,[r1],#1
cmp r0,#',
BEQ jump1
swi 0x00
jump1:
cmp r0,#0
BNE loop


ldr r0,=InFileHandle
str r0,[r0]
swi 0x68


InFile: .asciz "out.txt"
Read: .skip 80
InFileHandle: .word 0