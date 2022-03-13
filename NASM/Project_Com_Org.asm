; BITS 64;

.data
    ; num1 DWORD ?
    ; num2 DWORD ?
    ; num3 DWORD ?
    ; temp DWORD ?
    global main

.code   
main:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, 13
    syscall
    
    mov eax, 60
    xor rdi, rdi
    syscall

message:
    db "Hello world", 10