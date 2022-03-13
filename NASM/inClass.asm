.data
    a DWORD ?
    b DWORD ?
.code
    mov eax, value1 ;eax = a
    mov ebx, value2 ;ebx = b
    cmp eax, 0 ;if(a==0) 
    jnz L1 ; jump if not zero L1: else if (b==0)
    cmp ebx, 0
    jnz L1
    mov ebx, 1
    jmp exit

L1: cmp ebx, 0 ; if(b==0)
    jnz L2 ;jump to else if 
    mov ebx, ebx 
    jmp exit

L2: cmp eax, 0
    jz exit
    beginwhile:
        cmp eax, ebx
        je endwhile
    cmp eax, ebx
    jg L3
    SUB ebx, eax
    endwhile:
        jmp exit

L3: SUB eax, ebx
    ret

exit: ret
