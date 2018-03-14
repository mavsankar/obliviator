mov r5,#1004


loop:


mov r1,#0
loop1:
add r1,r1,#1
cmp r1,r5
mov r0,#0x02   @make left led active
swi 0x201	@make the active led glow
BNE loop1



mov r1,#0
loop2:
add r1,r1,#1

mov r0,#0x01 	@make right led active
swi 0x201	@make the active led glow
cmp r1,r5
BNE loop2


BEQ loop


@0x03 is to make both the leds active