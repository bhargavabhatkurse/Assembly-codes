section .data
hello db 'hello world',10
hellolen equ $-hello
name db 'Bhargava',10
namelen equ $-name
sys_exit equ 1
sys_write equ 4
stdin equ 0
stdout equ 1
section .text
global _start

_start: 
mov eax, sys_write
mov ebx, stdout
mov ecx, hello
mov edx, hellolen
int 80h

mov eax, sys_write
mov ebx, stdout
mov ecx, name
mov edx, namelen
int 80h

mov eax, sys_exit
mov ebx, stdin
int 80h


