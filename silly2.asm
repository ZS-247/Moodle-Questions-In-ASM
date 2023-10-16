; Original prompt: Write a C# code that takes three lower case letters as input and display them in reverse order in upper case.
; I will attempt to recreate the same thing in x64 assembly.
bits 64
default rel

segment .data
    msgone db "Please enter 3 lowercase letters:", 0
    fmtstr db "%s", 0

segment .bss
   letters db 8 

segment .text
global main

extern _CRT_INIT
extern printf
extern scanf
extern getchar
extern putchar
extern ExitProcess

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    call _CRT_INIT
    lea rcx, [msgone]
    call printf
    call getletters
    xor rax, rax
    call ExitProcess

getletters:
    ;push rbp
    ;move rbp, rsp
    sub rsp, 64 
    lea rcx, [fmtstr]
    lea rdx, [letters] 
    call scanf
    ; move letters to stack
    mov rax, [letters]
    mov [rbp-8], rax
    ; print each letter in reverse order
    mov rax, [rbp-6] 
    lea rcx, [rax]
    sub rcx, 32
    call putchar
    mov rax, [rbp-7]
    lea rcx, [rax]
    sub rcx, 32
    call putchar
    mov rax, [rbp-8]
    lea rcx, [rax]
    sub rcx, 32
    call putchar
    leave



