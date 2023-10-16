; c# coding assignment done in assembly for fun
; From: Assessment work uploads 16 
; Task 1
bits 64
default rel

segment .data
    intro db " please enter only whole numbers. For example july would become '7' and the 4th of july would become '4'", 10, 0 
    msgone db "Please input your name: ", 0
    msgtwo db "Please input current year: ", 0
    msgthree db "Please the current month: ", 0
    msgfour db "Please input the current day of the month: ", 0
    msgfive db "Please input your birth year: ", 0
    msgsix db "Please input your birth month: ", 0
    msgseven db "Please input your the day of the month you were born: ", 0
    msgeight db "Your age is: ", 0
    msgnine db "Goodbye ", 0
    debugmessage db "triggered", 0
    fmt db "%s", 0
    fmt2 db "%d", 0

segment .text
global main

extern _CRT_INIT
extern printf
extern scanf
extern ExitProcess
main:
    push rbp
    mov rbp, rsp
    sub rsp, 32 
    call _CRT_INIT
    lea rcx, [msgone] ; please input your name
    call printf
    lea rcx, [fmt] 
    lea rdx, [name] 
    call scanf
    mov rax, [name]
    lea rcx, [name]
    call printf
    lea rcx, [intro] ; intro 
    call printf
    lea rcx, [msgtwo] ; current year
    call printf
    lea rcx, [fmt2]
    lea rdx, [dateyear] ; current year goes into year
    call scanf
    ; lea rcx, [fmt2]
    ; mov rdx, [dateyear] 
    ; call printf
    lea rcx, [msgthree] ; current month
    call printf
    lea rcx, [fmt2]
    lea rdx, [datemonth]
    call scanf
    lea rcx, [msgfour] ; current day 
    call printf
    lea rcx, [fmt2]
    lea rdx, [birthday]
    call scanf
    lea rcx, [msgfive] ; birth year
    call printf
    lea rcx, [fmt2]
    lea rdx, [birthyear]
    call scanf
    lea rcx, [msgsix] ; birth month 
    call printf
    lea rcx, [fmt2]
    lea rdx, [birthmonth]
    call scanf
    lea rcx, [msgseven] ; birth day 
    call printf
    lea rcx, [fmt2]
    lea rdx, [dateday]
    call scanf
    nop
    mov rax, [dateyear]
    mov rbx, [birthyear]
    sub rax, rbx
    mov [age], rax
    mov rax, [datemonth]
    mov rbx, [birthmonth]
;    jmp .debug
    cmp rbx, rax
    je .checkday
    jg .end
    jmp .sub

.checkday:
    mov rax, [dateday]
    mov rbx, [birthday]
    cmp rax, rbx
    jge .end ; Jump to .end if rax (birthday) is less than or equal to dateday
    jl .sub  ; Jump to .sub if rax (birthday) is greater
.sub:
    mov rax, [age]
    sub rax, 1
    mov [age], rax
    jmp .end

.end:
    mov rax, [age]
    lea rcx, [msgeight]
    call printf
    lea rcx, [fmt2]
    mov rdx, [age]
    call printf
    xor rax, rax
    call ExitProcess

section .bss ; uninitialized data (easier than using stack)
    birthyear resd 1
    birthmonth resd 1
    birthday resd 1
    dateyear resd 1
    datemonth resd 1
    dateday resd 1
    age resd 1
    name resb 20

