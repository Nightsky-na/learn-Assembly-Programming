%include "asm_io.inc" 

segment _DATA public align=4 class=DATA use32
Description1 db `--Descending sort three integers that is given by a user. \n`, 0 ; receive String
space db ' ',0
segment _BSS public align=4 class=BSS use32 ; declar a variable
num1 resd 1 ; num1
num2 resd 1 ; num2
num3 resd 1 ; num3 

;group DGROUP _BSS _DATA

segment _TEXT public align=1 class=CODE use32 ;main
        global _asm_main
_asm_main:
        enter   0,0
        pusha

        mov eax, Description1
        call print_string ;print String (description)

        call read_int
        mov [num1], eax ;enter num1
        
        call read_int
        mov [num2], eax ;enter num2

        call read_int
        mov [num3], eax ;enter  num3

        mov eax, [num1]
        cmp eax, [num2] ;compare
        JGE L1 ; jump if greater than or equal (if leftOp>= rightOp)
        jmp next 
    
L1:
        mov eax, [num2]
        cmp eax, [num3]
        JGE L2  ; jump if greater than or equal (if leftOp>= rightOp)
        jmp next

L2:
        mov eax, [num1]
        call print_int
        mov eax, space
        call print_string 
        mov eax, [num2]
        call print_int
        mov eax, space
        call print_string 
        mov eax, [num3]
        call print_int
        jmp exit

        ;ret
next: 
        mov eax, [num1]
        cmp eax, [num3]
        JGE L3  ; jump if greater than or equal (if leftOp>= rightOp)
        jmp next2
L3:     
        mov eax, [num3]
        cmp eax, [num2]
        JGE L4  ; jump if greater than or equal (if leftOp>= rightOp)
        jmp next2
L4:     
        mov eax, [num1]
        call print_int
        mov eax, space
        call print_string 
        mov eax, [num3]
        call print_int
        mov eax, space
        call print_string 
        mov eax, [num2]
        call print_int
        jmp exit
next2:
        mov eax, [num2]
        cmp eax, [num1]
        JGE L5  ; jump if greater than or equal (if leftOp>= rightOp)
        jmp next3
L5:     
        mov eax, [num1]
        cmp eax, [num3]
        JGE L6
        jmp next3
L6:    
        mov eax, [num2]
        call print_int
        mov eax, space
        call print_string 
        mov eax, [num1]
        call print_int
        mov eax, space
        call print_string 
        mov eax, [num3]
        call print_int
        jmp exit
next3:
        mov eax, [num2]
        cmp eax, [num3]
        JGE L7  ; jump if greater than or equal (if leftOp>= rightOp)
        jmp next4
L7:     
        mov eax, [num3]
        cmp eax, [num1]
        JGE L8  ; jump if greater than or equal (if leftOp>= rightOp)
        jmp next4
L8:
        mov eax, [num2]
        call print_int
        mov eax, space
        call print_string 
        mov eax, [num3]
        call print_int
        mov eax, space
        call print_string 
        mov eax, [num1]
        call print_int
        jmp exit
next4:
        mov eax, [num3]
        cmp eax, [num1]
        JGE L9  ; jump if greater than or equal (if leftOp>= rightOp)
        jmp next5
L9:
        mov eax, [num1]
        cmp eax, [num2]
        JGE L10  ; jump if greater than or equal (if leftOp>= rightOp)
        jmp next5
L10:
        mov eax, [num3]
        call print_int
        mov eax, space
        call print_string 
        mov eax, [num1]
        call print_int
        mov eax, space
        call print_string 
        mov eax, [num2]
        call print_int
        jmp exit
next5:
        mov eax, [num3]
        cmp eax, [num2]
        JGE L11  ; jump if greater than or equal (if leftOp>= rightOp)
        jmp exit
L11:
        mov eax, [num2]
        cmp eax, [num1]
        JGE L12
        jmp exit
L12:
        mov eax, [num3]
        call print_int
        mov eax, space
        call print_string 
        mov eax, [num2]
        call print_int
        mov eax, space
        call print_string 
        mov eax, [num1]
        call print_int
        jmp exit
exit:
        ret ;return 0