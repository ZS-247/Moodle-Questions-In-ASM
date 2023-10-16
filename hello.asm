bits 64
default rel

segment .data
    msgone db "Hello world", 0

segment .text
global main

extern _CRT_INIT
extern printf
extern ExitProcess
main:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    call _CRT_INIT
    lea rcx, [msgone]
    call printf
    xor rax, rax
    call ExitProcess

