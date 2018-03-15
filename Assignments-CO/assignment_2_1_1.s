.equ SWI_Open, 0x66
.equ SWI_Close, 0x68
.equ SWI_Exit, 0x11
.equ SWI_ReadInt, 0x6c
.equ SWI_WriteInt, 0x6b
.equ SWI_WriteStr, 0x69

_start:
	ldr r0,=Filename
	mov r1, #1
	swi SWI_Open
	ldr r1, =Filehandle
	str r0, [r1]
	
	ldr r0, =v1
	mov r1, #0
	mov r3, #1
	bl _init	
	
	mov r4, #1
	bl _add_caller

	bl _move_caller

	bl _merge

	bl _multiply_caller
	
	bl _move_caller
	
	bl _merge	

	bl _divide_caller

	bl _move_caller
	
	bl _merge	

	ldr r0, =v1
	mov r1, #0
	bl _add_last
	
	bl _move_caller

	bl _merge

	ldr r4, =v1
	mov r5, #0	
	bl _write
	
	bl _verify

	mov r0, #1
	mov r1, #0
	add r1, r1, r3
	swi SWI_WriteInt

	ldr r0, =Filehandle
	ldr r0, [r0]
	swi SWI_Close
	
	swi SWI_Exit

_write:
	cmp r5, #100	
	beq _restore
	add r6, r4, r5, lsl #2
	ldr r1, [r6]
	ldr r0, =Filehandle
	ldr r0, [r0]
	swi SWI_WriteInt
	ldr r1, =NL
	swi SWI_WriteStr
	add r5, r5, #1
	b _write

_divide_caller:
	ldr r0, =v1
	mov r1, #0
	b _divide

_add_caller:
	ldr r0, =v1
	mov r1, #0	
	b _add_to_each	

_move_caller:
	ldr r0, =v1
	ldr r1, =v2
	mov r2, #0
	b _move

_move_caller1:
	ldr r0, =v1
	ldr r1, =v3
	mov r2, #0
	b _move

_move_caller2:
	ldr r0, =v1
	ldr r1, =v2
	mov r2, #0
	b _move

_merge:
	ldr r0, =v2
	ldr r1, =v1
	ldr r2, =v1
 	mov r3, #0
	b _add

_multiply_caller:
	ldr r0, =v1
	mov r1, #0
	b _multiply

_verify:
	ldr r0, =v1
	mov r1, #0
	mov r3, #0
	b _sum	

_restore:
	mov pc, lr

_init:
	cmp r1, #100
	beq _restore
	add r2, r0, r1, lsl #2
	str r1, [r2]
	add r1, r1, #1
	b _init

_add_to_each:	
	cmp r1, #100
	beq _restore
	add r2, r0, r1, lsl #2
	ldr r3, [r2]
	add r3, r3, r4
	str r3, [r2]
	add r1, r1, #1
	b _add_to_each

_multiply:
	cmp r1, #100
	beq _restore
	add r2, r0, r1, lsl #2
	ldr r3, [r2]
	add r3, r3, r3, lsl #2
	str r3, [r2]
	add r1, r1, #1
	b _multiply

_divide:
	cmp r1, #100
	beq _restore
	add r2, r0, r1, lsl #2
	ldr r3, [r2]
	mov r4, #0
	add r3, r4, r3, lsr #2
	str r3, [r2]
	add r1, r1, #1
	b _divide
	
_sum:	
	cmp r1, #1
	beq _restore
	add r2, r0, r1, lsl #2
	ldr r4, [r2]
	add r3, r3, r4
	add r1, r1, #1
	b _sum

_move:	
	cmp r2, #100
	beq _restore
	add r3, r0, r2, lsl #2
	add r4, r1, r2, lsl #2
	ldr r5, [r3]
	str r5, [r4]
	add r2, r2, #1
	b _move

_add:
	cmp r3, #100
	beq _restore
	add r4, r0, r3, lsl #2
	add r5, r1, r3, lsl #2
	ldr r6, [r4]
	ldr r7, [r5]
	add r6, r6, r7
	mov r4, #0
	add r4, r2, r3, lsl #2
	str r6, [r4]
	add r3, r3, #1
	b _add

_add_last:
	cmp r1, #100
	beq _restore
	add r2, r0, r1, lsl #2
	str r6, [r2]
	mov r4, #1
	mov r5, #0
	add r5, r6, r4, lsl #14
	str r5, [r2]
	add r1, r1, #1
	b _add_last
	
Filename: .asciz "inp.txt"
v1: .skip 400
v2: .skip 400
v3: .skip 400
NL: .asciz " "
Filehandle: .word 0