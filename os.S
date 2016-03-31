.code16
.text
start:
_start: 
real_start:
    movw %cs, %ax
    movw %ax, %ds
    movw %ax, %ss
    movw %ax, %es

    movw $greeting, %si
    call message

forever:
    jmp forever

1:
    movb $0xe, %ah
    movw $0x0001, %bx
    int $0x10
message:
    lodsb
    cmpb $0, %al
    jnz 1b
    ret


greeting:
    .asciz "Hello World\r\n"


    . = 510 + _start
boot_flag:
	.word 0xAA55
