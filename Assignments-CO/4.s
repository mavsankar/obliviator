mov r0,#3
sloop:
add r0,r0,#7
cmp r0,#1004

BNE sloop
add r0,r0,#-6

mov r2,#1

oloop:
mov r1,#3

lloop:
add r1,r1,#7
cmp r1,#1004
BNE lloop
add r2,r2,#1
add r1,r1,#-3 
cmp r2,#10
BNE oloop
mov r3,#5

swi 0x11
