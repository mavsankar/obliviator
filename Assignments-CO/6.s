mov r5,#102400
zero: .word 0x80|0x40|0x20|0x08|0x04|0x01
loop:

mov r1,#0
loop1:
add r1,r1,#1
cmp r1,r5
ldr r2,=zero
ldr r0,[r2]

swi 0x200
BNE loop1



mov r1,#0
loop2:
add r1,r1,#1

mov r0,#0x060
swi 0x200
cmp r1,r5
BNE loop2


mov r1,#0
loop3:
add r1,r1,#1

mov r0,#0x0CE
swi 0x200
cmp r1,r5
BNE loop3


mov r1,#0
loop4:
add r1,r1,#1

mov r0,#0x0EA
swi 0x200
cmp r1,r5
BNE loop4



mov r1,#0
loop5:
add r1,r1,#1

mov r0,#0x063
swi 0x200
cmp r1,r5
BNE loop5


mov r1,#0
loop6:
add r1,r1,#1

mov r0,#0x0AB
swi 0x200
cmp r1,r5
BNE loop6


mov r1,#0
loop7:
add r1,r1,#1

mov r0,#0x02F
swi 0x200
cmp r1,r5
BNE loop7


mov r1,#0
loop8:
add r1,r1,#1

mov r0,#0x0E0
swi 0x200
cmp r1,r5
BNE loop8


mov r1,#0
loop9:
add r1,r1,#1

mov r0,#0x0EF
swi 0x200
cmp r1,r5
BNE loop9


mov r1,#0
loop10:
add r1,r1,#1

mov r0,#0x0E3
swi 0x200
cmp r1,r5
BNE loop10





BEQ loop
