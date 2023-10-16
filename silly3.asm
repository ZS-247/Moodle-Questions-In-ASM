bits 64
default rel

segment .data
    msg db "Please enter a number:", 0
    nurse db 0xd, 0xa, "you can go to nursery", 0xd, 0xa, 0
    collegemsg db 0xd, 0xa, "you can go to college!", 0xd, 0xa, 0
    schoolmsg db 0xd, 0xa, "you can go to school!", 0xd, 0xa, 0
    fmstr db "%d", 0

segment .bss
    num resb 4
    
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
    lea rcx, [msg]
    call printf
    lea rcx, [fmstr]
    lea rdx, [num] ; the address of num
    call scanf
    mov eax, [num] ; move the number to eax
    cmp eax, 10h ; compare the number 
    jge college 
    cmp eax, 5h; compare the number
    jl nursery
    lea rcx, [schoolmsg]
    call printf
    xor rax, rax
    call ExitProcess

nursery:
    sub rsp, 32
    lea rcx, [nurse]
    call printf
    xor rax, rax
    call ExitProcess

college:
    sub rsp, 32
    lea rcx, [collegemsg]
    call printf
    xor rax, rax
    call ExitProcess
