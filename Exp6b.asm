section .data
msg1 db 'Enter the number :'
msg1Len equ $-msg1
msg2 db 'The fibonacci series is:  '
msg2Len equ $-msg2
space db 32

section .bss
num resb 5
i resb 1
x resb 1
y resb 1
z resb 1

section .text
global _start
_start:

mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,msg1Len
int 80h

mov eax,3
mov ebx,2
mov ecx,num
mov edx,5
int 80h

mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,msg2Len
int 80h

CALL fibo

end:
mov eax,1
mov ebx,0
int 80h



SYS_WRITEX:
mov eax,4
mov ebx,1
mov ecx,x
mov edx,1
int 80h
ret

SYS_WRITEY:
mov eax,4
mov ebx,1
mov ecx,y
mov edx,1
int 80h
ret

SYS_WRITEZ:
mov eax,4
mov ebx,1
mov ecx,z
mov edx,1
int 80h
ret

SYS_WRITE_space:
mov eax,4
mov ebx,1
mov ecx,space
mov edx,1
int 80h
ret

SUM:
mov eax,[x]
sub eax,'0'
mov ebx,[y]
sub ebx,'0'
add eax,ebx
add eax,'0'
mov [z],eax
ret


fibo:
mov byte [x],'0' ;initialise
mov byte [y],'1'

cmp byte [num], '0' ;for 0 terms i.e nothing is printed
je end

CALL SYS_WRITEX ; for one term i.e 0
CALL SYS_WRITE_space

cmp byte [num], '1' ;If only one term needs to be printed
je end

CALL SYS_WRITEY ;for second term i.e 1
CALL SYS_WRITE_space

mov byte[i],'2' ;initialise i
repeat:
mov al,[i]
cmp al,byte[num] ;repeat until i<n
jge end	  ;terminate

CALL SUM 	;z=x+y

CALL SYS_WRITEZ ;print z
CALL SYS_WRITE_space

mov al,[y] 	;x=y
mov [x],al
mov al,[z] 	;y=z
mov [y],al

inc byte[i] 	;increment

jmp repeat     ;loop
ret
