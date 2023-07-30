section .data
str1 db 'Enter number', 10
str1Len equ $-str1
str2 db 'Factorial is: ', 10
str2Len equ $-str2

segment .bss
n resb 1
fact resb 1

section .text
global _start

_start:	
	
	
	call print_before
	call accept
	mov eax,'1'
	mov [fact],eax
	call factorial
	call print_after

	;terminating
	mov eax,1
	mov ebx,0
	int 80h

accept: 
	mov eax,3
	mov ebx,2
	mov ecx, n
	mov edx, 1
int 80h
ret

print_before : 
	mov eax,4
	mov ebx,1
	mov ecx, str1
	mov edx, str1Len

int 80h
ret

print_n : 
	mov eax,4
	mov ebx,1
	mov ecx, n
	mov edx, 1

int 80h
ret


print_after: 
	mov eax,4
	mov ebx,1
	mov ecx, str2
	mov edx, str2Len

int 80h

	mov eax,4
	mov ebx,1
	mov ecx, fact
	mov edx, 10

int 80h
ret

factorial: 
l1:
mov al, [n]
sub al,'0'
mov bl, 0
cmp al,bl
je l2

	mov bl, [n]
	sub bl, '0'
	mov al,[fact]
	sub al, '0'
	mul bl
	add al, '0'
	mov [fact], al
	dec byte[n]
	jmp l1
l2:
ret

