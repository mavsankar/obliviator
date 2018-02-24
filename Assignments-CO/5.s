mov r5,#104


loop:


mov r1,#0
loop1:
add r1,r1,#1
cmp r1,r5
mov r0,#0x02
swi 0x201
BNE loop1



mov r1,#0
loop2:
add r1,r1,#1

mov r0,#0x01
swi 0x201
cmp r1,r5
BNE loop2


BEQ loop
