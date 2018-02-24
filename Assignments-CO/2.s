ldr r0,=InFileName
mov r1,#0
swi 0x66
ldr r1,=InFileHandle
str r0,[r1]
ldr r0,=InFileHandle
ldr r0,[r0]
ldr r1,=readings
mov r2,#80
swi 0x6a
ldr r0,=readings
swi 0x02

InFileName: .asciz "file.txt"
InFileHandle: .word 0
readings: .skip 80