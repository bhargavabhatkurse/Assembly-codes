section .data
name db 'Flat ALC',10
namelen equ $-name
sys_exit equ 1
sys_write equ 4
stdin equ 0
stdout equ 1
section .text
global _start

_start: 

mov [name],dword 'TOC'
mov eax, sys_write
mov ebx, stdout
mov ecx, name
mov edx, namelen
int 80h

mov eax, sys_exit
mov ebx, stdin
int 80h


