%include "asm_io.inc"

segment .data 
Message db "Hello world",0

segment .text
    global _asm_main
_asm_main:
    enter 0,0
    pusha

    mov eax, Message
    call print_string
    ret
    