mov r1,#0

loop1:

mov r0,#0
loop:

add r0,r0,#1
cmp r0,#328
BNE loop


add r1,r1,#1
cmp r1,#10
BNE loop1
mov r0,#0
loop2:

add r0,r0,#1
cmp r0,#39
BNE loop2
swi 0x11