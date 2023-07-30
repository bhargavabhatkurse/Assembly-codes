section .data
str1 db 'Enter 1st number: ',10
str1len equ $-str1
str2 db 'Enter 2nd number: ',10
str2len equ $-str2

strr1 db '1st number: ',10
strr1len equ $-strr1
strr2 db '2nd number: ',10
strr2len equ $-strr2

sys_exit equ 1
sys_write equ 4
stdin equ 0
stdout equ 1
sys_read equ 3
sys_read1 equ 2

section .bss
num1 resb 5
num2 resb 5

section .text
global _start

_start: 
mov eax, sys_write
mov ebx, stdout
mov ecx, str1
mov edx, str1len
int 80h


mov eax, sys_read
mov ebx, sys_read1
mov ecx, num1
mov edx, 5
int 80h

mov eax, sys_write
mov ebx, stdout
mov ecx, str2
mov edx, str2len
int 80h

mov eax, sys_read
mov ebx, sys_read1
mov ecx, num2
mov edx, 5
int 80h

mov eax, sys_write
mov ebx, stdout
mov ecx, strr1
mov edx, strr1len
int 80h

mov eax, sys_write
mov ebx, stdout
mov ecx, num1
mov edx, 5
int 80h

mov eax, sys_write
mov ebx, stdout
mov ecx, strr2
mov edx, strr2len
int 80h

mov eax, sys_write
mov ebx, stdout
mov ecx, num2
mov edx, 5
int 80h

mov eax, sys_exit
mov ebx, stdin
int 80h


