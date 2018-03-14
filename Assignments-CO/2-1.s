@every where 2.k denotes copying read into read1
@4.k denotes operations +1,*5,/4,+16384 for k=0 to 3 respectively
@3.k denotes add read and read1



ldr r0,=Read @r0 contains address of buffer named 'Read';
mov r1,#0
mov r5,#0
loop:
add r1,r1,#1
str r1,[r0],#4 	@after storing r1 into content of r0(array) skip the array pointer by 4bytes
add r5,r5,#4
cmp r5,#400
BNE loop
@ operation 1: copying first array into a new array:
ldr r0,=Read
ldr r7,=Read1
mov r1,#0
mov r5,#0
ldr r8,[r0]  @loading content of r0 into r8 i.e r8 will have value at starting pos of the array
loop2:
str r8,[r7],#4   @copy the r8 into contents of r7 and increment the index

ldr r8,[r0,#4]  @ pre-increment [r0] and then load the content of r0 into r8
 
@add r0,r0,#4
add r5,r5,#4
cmp r5,#400
BNE loop2

@operaation: adding 1 to every number in the array
ldr r0,=Read  @make r0 point to the first place of the array
mov r5,#0
mov r1,#1
loop4:
ldr r3,[r0]
add r3,r1,r3
str r3,[r0],#4

add r5,r5,#4
cmp r5,#400
BNE loop4
@adding contents of read and read1:
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
@again copying read into read1
ldr r0,=Read
ldr r7,=Read1
mov r1,#0
mov r5,#0
ldr r8,[r0]
loop2.1:
str r8,[r7],#4

ldr r8,[r0,#4]

@add r0,r0,#4
add r5,r5,#4
cmp r5,#400
BNE loop2.1
@multiply every number of read by 5
ldr r0,=Read
mov r5,#0
mov r1,#5
loop4.1:
ldr r3,[r0]
add r3,r3,r3,lsl #2  @ r3=(r3<<2)+r3
str r3,[r0],#4

add r5,r5,#4
cmp r5,#400
BNE loop4.1
@again add read and read1
ldr r0,=Read
ldr r7,=Read1
mov r5,#0
loop3.1:
ldr r3,[r0]
ldr r6,[r7],#4
add r1,r3,r6
str r1,[r0],#4
add r5,r5,#4
cmp r5,#400
BNE loop3.1

ldr r0,=Read
ldr r7,=Read1
mov r1,#0
mov r5,#0
ldr r8,[r0]
loop2.2:
str r8,[r7],#4

ldr r8,[r0,#4]

add r0,r0,#4
add r5,r5,#4
cmp r5,#400
BNE loop2.2

ldr r0,=Read
mov r5,#0

loop4.2:
ldr r3,[r0]
mov r3,r3,lsr #2
str r3,[r0],#4

add r5,r5,#4
cmp r5,#400
BNE loop4.2

ldr r0,=Read
ldr r7,=Read1
mov r5,#0
loop3.2:
ldr r3,[r0]
ldr r6,[r7],#4
add r1,r3,r6
str r1,[r0],#4
add r5,r5,#4
cmp r5,#400
BNE loop3.2

ldr r0,=Read
ldr r7,=Read1
mov r1,#0
mov r5,#0
ldr r8,[r0]
loop2.3:
str r8,[r7],#4

ldr r8,[r0,#4]

add r0,r0,#4
add r5,r5,#4
cmp r5,#400
BNE loop2.3

ldr r0,=Read
mov r5,#0
mov r1,#16384
loop4.3:
ldr r3,[r0]
add r3,r1,r3
str r3,[r0],#4

add r5,r5,#4
cmp r5,#400
BNE loop4.3

ldr r0,=Read
ldr r7,=Read1
mov r5,#0
loop3.3:
ldr r3,[r0]
ldr r6,[r7],#4
add r1,r3,r6
str r1,[r0],#4
add r5,r5,#4
cmp r5,#400
BNE loop3.3
ldr r0,=OutFileName
mov r1,#1
swi 0x66
mov r3,#0
mov r6,#0
ldr r9,=Read
loop1:
ldr r1,[r9],#4
swi 0x6b

add r6,r6,#4
cmp r6,#400
BNE loop1
swi 0x11

Read: .skip 100*4 	@ a buffer of size 400bytes (It can store 100 ints)
Read1: .skip 100*4

OutFileName: .asciz "file11.txt"
OutFileHandle: .word 0