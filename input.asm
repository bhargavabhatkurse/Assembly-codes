section .data
str1 db 'Enter the Number: ',10
strlen1 equ $-str1
str2 db 'the Number: ',10
strlen2 equ $-str2
section .bss
num resb 5

section .text
global _start

_start: 
mov eax, 4
mov ebx, 1
mov ecx, str1
mov edx, strlen1
int 80h

mov eax, 3
mov ebx, 2
mov ecx, num
mov edx, 5
int 80h

mov eax, 4
mov ebx, 1
mov ecx, str2
mov edx, strlen2
int 80h

mov eax, 4
mov ebx, 1
mov ecx, num
mov edx, 5
int 80h




mov eax, 1
mov ebx, 0
int 80h


