#Averaging filter
.data
msg1:   .asciiz "The old array is:\n"
	.extern foobar 4
msg2: 	.asciiz "\nThe new array is:\n"
	.extern foobar 4
msg3: 	.asciiz " "
	.extern foobar 4	
	
	size: .word 12
	array: .word 50,53,52,49,48,51,99,45,53,47,47,50
	result: .word 0,0,0,0,0,0,0,0,0,0,0,0
.text
	main:
	la $t0,array			# $t0 = array[0]
	la $t1,result			# $t1 = result[0]
	lw $t2,size			# $t2 = size = 12
	li $t3,0			# $t3 = i = 0
	lw $t8,size			
	sub $t8,$t8,1			# $t8 = size - 1
	
	lw $t4,($t0)		# $t4 = array[i] 
	sw $t4,($t1)		# result[i] = $t4
        addi $t0,$t0,4		#  $t0 = $t0 + 4
	addi $t1,$t1,4		#  $t1 = $t1 + 4
	addi $t3,$t3,1		#  i = i + 1 
	
	loop:
		lw $t4,($t0)			# $t4 = arr[i]
		add $t5,$t0,4
		sub $t6,$t0,4
		lw $t5,($t5)		        # $t5 = arr[i+1]
		lw $t6,($t6)			# $t6 = arr[i-1]
		
		add $t4,$t4,$t5			# $t4 = $t4 + $t5
		add $t4,$t4,$t6			# $t4 = $t4 + $t6
		div $t4,$t4,3			# $t4 = $t4/3
		sw $t4,($t1)			# result[i] = $t4
		addi $t0,$t0,4			#  $t0 = $t0 + 4
		addi $t1,$t1,4			#  $t1 = $t1 + 4
		addi $t3,$t3,1			#  i = i + 1 
		blt $t3,$t8,loop		#  while(i<size)
				
	
	lw $t4,($t0)		# $t4 = array[i] 
	sw $t4,($t1)		# result[i] = $t4
	addi $t0,$t0,4		#  $t0 = $t0 + 4
	addi $t1,$t1,4		#  $t1 = $t1 + 4
	addi $t3,$t3,1		#  i = i + 1 

	la $t0,array			 # $t0 = array[0]
	li $t3,0			 # $t3 = i = 0
	
	li $v0, 4       		 # Printing message 2
        la $a0, msg1     
        syscall         
        lw $t1, foobar
        
	loop1:
		lw $t4,($t0)		# $t4 = array[i]
		
		li $v0, 1		# print array[i]
		move $a0,$t4
		syscall		
		
		li $v0, 4              # Printing space
        	la $a0, msg3     
        	syscall         
        	lw $t1, foobar
		
		add $t0,$t0,4		#  $t0 = $t0 + 4
		addi $t3,$t3,1		#  i = i + 1 
		blt $t3,$t2,loop1	#  while( i < size)

	la $t1,result			# $t1 = result[0]
	li $t3,0			# $t3 = i = 0
	
	li $v0, 4        		# Printing message 2
        la $a0, msg2     
        syscall        
        lw $t1, foobar
        
        loop2:
		lw $t4,($t0)		 # t4 = result[i]
			
		li $v0, 1		 # print result[i]
		move $a0,$t4
		syscall				
		
		li $v0, 4               # printing space
        	la $a0, msg3     
        	syscall         
        	lw $t5, foobar
        																							
		add $t0,$t0,4		#  $t1 = $t1 + 4
		addi $t3,$t3,1		#  i = i + 1 
		blt $t3,$t2,loop2	# while( i < size)
		
	li $v0,17
	syscall
