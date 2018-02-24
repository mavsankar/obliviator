ldr r0,=OutFileName
mov r1,#1
swi 0x66
ldr r1,=OutFileHandle
str r0,[r1]
ldr r0,=OutFileHandle
ldr r0,[r0]
ldr r1,=Message
swi 0x69
ldr r0,=OutFileHandle
ldr r0,[r0]
swi 0x68

Message: .asciz "The string is printed into the file \n"
OutFileName: .asciz "file.txt"
OutFileHandle: .word 0

