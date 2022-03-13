%include "asm_io.inc"

segment _DATA public align=4 class=DATA use32
Message1         db      "Enter 1st Number : ", 0
Message2         db      "Enter 2nd Number : ", 0
Message3         db      "Enter 3rd Number : ", 0
Message4	 db	 "Original numbers : ",0
Message5	 db	 "ascending sort three integers of number : ",0
Message6	 db	 "---------------------------------------------------------"

segment _BSS public align=4 class=BSS use32
number1        resd    1               ; value1
number2        resd    1               ; value2
number3	       resd    1	       ; value3
Answer	       resd    1	       ; value4

group DGROUP _BSS _DATA

segment _TEXT public align=1 class=CODE use32
        global  _asm_main

_asm_main:
	mov	eax, Message1
	call	print_string

	call	read_int
	mov	DWORD PTR[number1],eax

	mov	eax, Message2
	call	print_string

	call	read_int
	mov	DWORD PTR[number2],eax

	mov	eax, Message3
	call	print_string
	
	call	read_int
	mov	DWORD PTR[number3],eax

;-----------------------------------------------------------

  	mov     ecx, DWORD PTR [number3]
	call	print_int
        mov     edx,  DWORD PTR [number2]
	call	print_int
        mov     eax,  DWORD PTR [number1]
	call	print_int
        mov     esi, eax
        mov     edi, Message4
	call	print_string
        mov     eax, 0

  	mov     edi, Message5
        mov     eax, 0
        call    print_string

      	mov     edx, [number1]
        mov     eax, [number2]
        cmp     edx, eax
        jle      .L2
        mov     edx, [number2]
        mov     eax, [number3]
        cmp     edx, eax
        jle      .L2
 	mov     ecx, [number3]
	call	print_int
        mov     edx, [number2]
	call	print_int
        mov     eax, [number1]
        call	print_int
	mov     esi, eax
 	mov     edi,Message5
	call	print_string
        mov     eax, 0
        jmp     .L3

.L2:
        mov     edx, [number1]
        mov     eax, [number3]
        cmp     edx, eax
        jle      .L4
        mov     edx, [number3]
        mov     eax, [number2]
        cmp     edx, eax
        jle      .L4
        mov     ecx, [number3]
	call	print_int
        mov     edx, [number2]
	call	print_int
        mov     eax, [number1]
	call	print_int
	mov     esi, eax
	mov     edi,Message5
	call	print_string
        mov     eax, 0
        jmp     .L3

.L4:
        mov     edx, [number2]
        mov     eax, [number1]
        cmp     edx, eax
        jle      .L5
        mov     edx, [number1]
        mov     eax, [number3]
        cmp     edx, eax
        jle      .L5
        mov     ecx, [number3]
	call	print_int
        mov     edx, [number1]
	call	print_int
        mov     eax, [number2]
	call	print_int
 	mov     esi, eax
	mov     edi,Message5
	call	print_string
        mov     eax, 0
        jmp     .L3

.L5:
        mov     edx, [number2]
        mov     eax, [number3]
        cmp     edx, eax
        jle      .L6
        mov     edx, [number3]
        mov     eax, [number2]
        cmp     edx, eax
        jle      .L6
        mov     ecx, [number1]
	call	print_int
        mov     edx, [number3]
	call	print_int
        mov     eax, [number2]
	call	print_int
        mov     esi, eax
	mov     edi,Message5
	call	print_string
        mov     eax, 0
        jmp     .L3

.L6:
        mov     edx, [number3]
        mov     eax, [number1]
        cmp     edx, eax
        jle      .L7
        mov     edx, [number1]
        mov     eax, [number2]
        cmp     edx, eax
        jle      .L7
        mov     ecx, [number1]
	call	print_int
        mov     edx, [number2]
	call	print_int
        mov     eax, [number3]
	call	print_int
        mov     esi, eax
	mov     edi,Message5
	call	print_string
        mov     eax, 0
        jmp     .L3

.L7:
        mov     edx, [number1]
        mov     eax, [number2]
        cmp     edx, eax
        jne     .L8
        mov     edx, [number2]
        mov     eax, [number3]
        cmp     edx, eax
        jne     .L8
        mov     ecx, [number3]
	call	print_int
        mov     edx, [number2]
	call	print_int
        mov     eax, [number1]
	call	print_int
        mov     esi, eax
	mov     edi,Message5
	call	print_string
        mov     eax, 0
        jmp     .L3

.L8:
        mov     ecx, [number1]
	call	print_int
        mov     edx, [number2]
	call	print_int
        mov     eax, [number3]
	call	print_int
        mov     esi, eax
	mov     edi,Message5
	call	print_string
        mov     eax, 0

.L3:
        mov     edi,Message6
        call	print_string
        mov     eax, 0
        leave
        ret


	