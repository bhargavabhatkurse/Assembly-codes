section .data
	msg db 'The Sum of the two 4-digit numbers : '
	msglen equ $-msg
	msg1 db 'Enter two 4-digit numbers :'
	msglen1 equ $-msg1
section .bss
	num1 resb 5
	num1len equ $-num1
	num2 resb 5
	num2len equ $-num2
	sum resb 5
	sumlen equ $-sum
	

section .text
	global _start
_start:
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,msglen1
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx,num1
	mov edx,num1len
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx,num2
	mov edx,num2len
	int 80h

	mov esi,3	;pointing rightmost digit
	mov ecx,4	;num of digits
	clc
add_loop:
	mov al,[num1+esi]
	adc al,[num2+esi]
	aaa
	pushf
	or al,30h
	popf
	mov[sum+esi],al
	dec esi
	loop add_loop
	
	mov eax,4
	mov ebx,1
	mov ecx, msg
	mov edx, msglen
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,sum
	mov edx,5
	int 80h
	
	mov eax,1
	int 80h
