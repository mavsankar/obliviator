
ldr r0,=Read
mov r1,#0
mov r5,#0
loop:
add r1,r1,#1
str r1,[r0],#4
add r5,r5,#4
cmp r5,#400
BNE loop

ldr r0,=Read
ldr r7,=Read1
mov r1,#0
mov r5,#0
ldr r8,[r0]
loop2:
str r8,[r7],#4

ldr r8,[r0,#4]

add r0,r0,#4
add r5,r5,#4
cmp r5,#400
BNE loop2
ldr r0,=Read
mov r5,#0

loop4:
ldr r3,[r0]
mov r3,r3,lsr #2
str r3,[r0],#4

add r5,r5,#4
cmp r5,#400
BNE loop4

ldr r0,=Read
ldr r7,=Read1
mov r5,#0
loop3:
ldr r3,[r0]
ldr r6,[r7],#4
add r1,r3,r6
str r1,[r0],#4
add r5,r5,#4
cmp r5,#400
BNE loop3

mov r3,#0
mov r6,#0
ldr r0,=Read
loop1:
ldr r4,[r0],#4
add r3,r3,r4

add r6,r6,#4
cmp r6,#400
BNE loop1
swi 0x11

Read: .skip 100*4
Read1: .skip 100*4
