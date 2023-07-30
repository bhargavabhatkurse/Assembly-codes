section .data
	
	str1 db 'Enter two numbers: '
	strlen equ $-str1
	spa db ' ', 10
	spalen equ $-spa
	disp1 db 'The sum is: '
	disp1len equ $-disp1
	disp2 db 'The difference is: '
	disp2len equ $-disp2
	disp3 db 'The product is: '
	disp3len equ $-disp3
	disp4 db 'The quotient is: '
	disp4len equ $-disp4
	disp5 db 'The remainder is: '
	disp5len equ $-disp5

segment .bss
	num1 resb 5
	num1len equ $-num1
	num2 resb 5	
	num2len equ $-num2
	sum resb 5
	sumlen equ $-sum
	dif resb 5
	diflen equ $-dif
	prod resb 5
	prodlen equ $-prod
	divi resb 5
	divilen equ $-divi
	rem resb 5
	remlen equ $-rem

section .text
    global _start
    
_start:
	mov ecx, str1
	mov edx, strlen 
  	call write
	int 80h
	
	mov ecx, num1
	mov edx, num1len 
  	call read
	int 80h
	
	mov ecx, num2
	mov edx, num2len 
  	call read
	int 80h
	
	mov ecx, [num1]
	mov edx, [num2] 
  	call addition
	int 80h
	
	mov ecx, disp1
	mov edx, disp1len 
  	call write
	int 80h
	
	mov ecx, sum
	mov edx, sumlen 
  	call write
	int 80h
	
	mov ecx, [num1]
	mov edx, [num2] 
  	call subtraction
	int 80h
	
	mov ecx, spa
	mov edx, spalen 
  	call write
	int 80h
	
	mov ecx, disp2
	mov edx, disp2len 
  	call write
	int 80h
	
	mov ecx, dif
	mov edx, diflen 
  	call write
	int 80h
	
	mov ecx, spa
	mov edx, spalen 
  	call write
	int 80h
	
	mov ecx, [num1]
	mov edx, [num2] 
  	call multiplication
	int 80h
	
	mov ecx, disp3
	mov edx, disp3len 
  	call write
	int 80h
	
	mov ecx, prod
	mov edx, prodlen 
  	call write
	int 80h
	
	mov ecx, spa
	mov edx, spalen 
  	call write
	int 80h
	
	mov ecx, [num1]
	mov edx, [num2] 
  	call division
	int 80h
	
	mov ecx, disp4
	mov edx, disp4len 
  	call write
	int 80h
	
	mov ecx, divi
	mov edx, divilen 
  	call write
	int 80h
	
	mov ecx, spa
	mov edx, spalen 
  	call write
	int 80h
	
    	mov ecx, disp5
	mov edx, disp5len 
  	call write
	int 80h
	
    	mov ecx, rem
	mov edx, remlen 
  	call write
	int 80h
	
	mov ecx, spa
	mov edx, spalen 
  	call write
	int 80h
	
  	mov eax,1
  	mov ebx,0
  	int 80h

write:
 	mov eax, 4
 	mov ebx, 1
	ret

read:
  	mov eax, 3
  	mov ebx, 2
  	ret

addition:
	mov eax, ecx
	sub eax, '0'
	mov ebx, edx
	sub ebx, '0'
	add eax, ebx
	add eax, '0'
	mov [sum], al
	ret

subtraction:
	mov eax, ecx
	sub eax, '0'
	mov ebx, edx
	sub ebx, '0'
	sub eax, ebx
	add eax, '0'
	mov [dif], eax
	ret

multiplication:
	mov eax, ecx
	sub eax, '0'
	mov ebx, edx
	sub ebx, '0'
	mul ebx
	add eax, '0'
	mov [prod], al
	ret

division:
	mov al, cl
	sub al, '0'
	mov bl, dl
	sub bl, '0'
	div bl
	add al, '0'
	mov [divi], al
	add ah, '0'
	mov [rem], ah
	ret
