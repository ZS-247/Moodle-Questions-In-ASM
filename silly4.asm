bits 64
default rel

segment .data
    msgone db "Please enter a number:", 0
    msgtwo db "Please enter your name: ", 0
    fmstr db "%d", 0
    fmstrtwo db "%s", 0
    newline db 0x0a, 0 ; new line
segment .bss
    num resb 4
    buffer resb 64

segment .text
global main

extern _CRT_INIT
extern printf
extern ExitProcess
extern scanf
extern getchar
extern putchar

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    call _CRT_INIT
    lea rcx, [msgone]
    call printf
    lea rcx, [fmstr]
    lea rdx, [num] ; the address of num
    call scanf
    lea rcx, [msgtwo]
    call printf
    lea rcx, [fmstrtwo] 
    lea rdx, [buffer]
    call scanf
    mov ebx, [num]
    test ebx, ebx 
    jnz printname
    xor rax, rax
    call ExitProcess

printname:
        lea rcx, [newline]
        call printf
        lea rcx, [buffer]
        call printf
        dec ebx
        test ebx, ebx
        jnz printname
        ret

