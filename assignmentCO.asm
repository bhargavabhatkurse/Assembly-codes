.global main

.data
	
	v: .byte 12
	w: .byte 97
	x: .byte 133
	y: .byte 82
	z: .byte 236
	sum: .asciiz "Sum is "
	average: .asciiz "\nAverage is "
	
.text

main:
	lb $t0, v 		#Storing v in t0
	lb $t1, w 		#storing w in t1
	add $t1, $t1, $t0	#t1 = v + w
	
	#loading unsinged byte because otherwise the MSB will be considered as a sign bit and  number will be considered negative
	lbu $t0, x		#Storing x in t0 | without lbu +133 will be considered as -123
	add $t1, $t1, $t0
	
	lb $t0, y		#Storing y in t0
	add $t1, $t1, $t0	#t1 =  v + w + x + y
	
	lbu $t0, z		#Storing z in t0 | without lbu +236 will be considered as -20
	add $t1, $t1, $t0	#t1 = v + w + x + y + z
	
	la $a0, sum		#Loading the address of string 'sum'
	li $v0, 4	
	syscall
	move $a0, $t1
	li $v0, 1
	syscall			#O/P sum
	
	la $a0, average		#Loading the address of string 'avg'
	li $v0, 4	
	syscall
	div $t2, $t1, 5		#t2 = (v + w + x + y + z)/5
	move $a0, $t2	
	li $v0, 1
	syscall			#O/P average
	
	li $v0, 10
	syscall			#Terminate the Program
