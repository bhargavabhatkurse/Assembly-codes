section .data
input1 db 'Enter number of elements : '
i_len1 equ $-input1

input2 db 'Enter elements in array : '
i_len2 equ $-input2

msg1 db 'Enter number to be searched: ' 
msg1len equ $-msg1

msg2 db 'Number found at index: ' 
msg2len equ $-msg2

msg3 db 'Number not found' 
msg3len equ $-msg3

newline db '',10
n1 equ $-newline

%macro write 2
	mov eax,4
	mov ebx,1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
 
%macro read 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

search:
	mov eax, 0
	mov [index],eax
	mov ecx,5
    
	mov esi,0

	label:

	movzx edi, byte[arr+esi]
	mov [temp],edi 
	mov al,[temp]
	mov bl,[searche]
	sub bl, '0'
	cmp al,bl
	je l1
	
	jmp end

	l1:
	write msg2, msg2len
	
	add esi, '0'
	mov [index], esi
	write index, 2
	write newline,n1	
	
	mov eax ,1
	mov ebx ,0
	int 80h

	end:
	inc esi
	loop label
ret
	

global arr 
arr dw 0,0,0,0,0,0,0,0,0,0
len equ 10

section .bss
searche resb 10
i resb 1
index resb 2
element resb 2
num resb 10
temp resb 5

section .text
global _start
_start:

	write input1, i_len1		
	read num, 10

	write input2, i_len2		

	mov byte[i], 0
	mov esi, arr

	input:
		read element, 2
		mov ebx, [element]
		sub ebx, '0'
		mov [esi], ebx

			
		inc esi
		inc byte[i]

		mov al, [i]
		mov bl, [num]
		sub bl,'0'
		CMP al,bl
		JL input

	mov byte[i], 0
	mov esi, arr

	write msg1, msg1len
	read searche, 10
	
	call search

	write msg3, msg3len
	write newline,n1

	mov eax ,1
	mov ebx ,0
	int 80h
