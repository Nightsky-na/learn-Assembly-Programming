%include "asm_io.inc"

segment _DATA public align=4 class=DATA use32
Message1         db      `--Find Max and Min--\n \n`, 0	
Message2         db      `Enter the first  number  :`, 0
Message3         db      "Enter the second number  :", 0
Message4         db      "Enter the third  number  :", 0
Message5         db      "The max and main of :",0
Message6         db      "Max is :",0
Message7         db      "Min is :",0
Message8         db      `\n __________________________________ \n`,0

segment _BSS public align=4 class=BSS use32
num1            resd    1           ;num1
num2            resd    1           ;num2
num3            resd    1           ;num3
temp            resd    1           ;int temp        

group DGROUP _BSS _DATA

segment _TEXT public align=1 class=CODE use32
        global _asm_main
_asm_main:
        enter   0,0
        pusha

        mov     eax, Message1
        call    print_string        ;printf("--Find Max and Min--");

        mov     eax, Message2
        call    print_string        ;printf("Enter the first  number  :");
        call    read_int            ;scanf("%d",&num1);  
        mov     [num1], eax

        mov     eax, Message3
        call    print_string        ;printf("Enter the first  number  :");
        call    read_int            ;scanf("%d",&num2); 
        mov     [num2], eax

        mov     eax, Message4       ;printf("Enter the third  number  :");
        call    print_string        ;scanf("%d",&num2); 
        call    read_int
        mov     [num3], eax

        mov     eax, [num1]
        cmp     eax, [num2]
        JG      L1                   ;if (num1>num2) jump to L1
        mov     eax, [num2]
        cmp     eax, [num3]
        JG      L2                   ;else for first if
        jmp     print_result
        ret


L1:                                  ;if (num1>num2) OUTER
        mov     eax, [num2]
        cmp     eax, [num3]   
        JG      L3                   ;if (num2 > num3) INER
        mov     eax, [num3]
        cmp     eax, [num1]
        JG      L4                  ;else if (num 3> num1) INER
        jmp     L5                  ;else  INER


L2:                                  ;else if (num2 >= num3) OUTER
        mov     eax, [num3]
        cmp     eax, [num1]
        JG      L6
        jmp     L7


L3:
        mov eax, [num3]
        mov ebx, [num1]
        mov [num3], ebx
        mov [num1], eax
        jmp print_result

L4:
        mov eax, [num1]
        mov ebx, [num2]
        mov [num1], ebx
        mov [num2], eax
        jmp print_result

L5:
        mov eax, [num2]
        mov ebx, [num3]
        mov [num2], ebx
        mov [num3], eax

        mov eax, [num1]
        mov ebx, [num3]
        mov [num1], ebx
        mov [num3], eax
        jmp print_result

L6:
        mov eax, [num2]
        mov ebx, [num3]
        mov [num2], ebx
        mov [num3], eax
        jmp print_result

L7:
        mov eax, [num3]
        mov ebx, [num1]
        mov [num3], ebx
        mov [num1], eax

        mov eax, [num3]
        mov ebx, [num2]
        mov [num3], ebx
        mov [num2], eax
        jmp print_result

print_result:
        mov     eax, Message8
        call    print_string
        mov     eax, Message6
        call    print_string
        mov     eax, [num3]
        call    print_int
        call    print_nl
        mov     eax, Message7
        call    print_string
        mov     eax, [num1]
        call    print_int
        ret

