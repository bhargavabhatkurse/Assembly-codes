
.data 
msg1:   .asciiz "Enter the length of the vector:\n"
	.extern foobar 4
msg2: 	.asciiz "\nEnter the elements of vector A:\n"
	.extern foobar 4
msg3: 	.asciiz "\nEnter the elements of vector B:\n"
	.extern foobar 4	
msg4: 	.asciiz "\nDot product of vector A and B is:"
	.extern foobar 4

	length:.word 0
	vectorA:.space 40 	#space for 10 integers
	vectorB:.space 40 	#space for 10 integers
	dotproduct: .word 0
.text
	main:
		la $t0,vectorA			# t0 = VectorA[0]
		la $t1,vectorB			# t1 = VectorA[0]
		li $t2,0
		
		li $v0, 4       		 # Printing message 1
        	la $a0, msg1     
        	syscall         
        	lw $t9, foobar
		
		# Get input for length
		li $v0,5
		syscall 
		move $t3,$v0
		sw $t3,length
		
		li $v0, 4       		 # Printing message 2
        	la $a0, msg2     
        	syscall         
        	lw $t9, foobar
        	
		# Get input fot vectorA
		loop1:
			li $v0,5
			syscall 
			move $t5,$v0
			sw $t5,($t0)
			add $t0,$t0,4
			addi $t2,$t2,1
			
        		blt  $t2,$t3,loop1
        
        	
        	li $v0, 4       		 # Printing message 3
        	la $a0, msg3     
        	syscall         
        	lw $t9, foobar
        	
        	li $t2,0
        	# Get input fot vectorB
		loop2:
			li $v0,5
			syscall 
			move $t5,$v0
			sw $t5,($t1)
			add $t1,$t1,4
			addi $t2,$t2,1
			
        		blt  $t2,$t3,loop2
        	
        	lw $t6,dotproduct
        	la $t0,vectorA
        	la $t1,vectorB
        	li $t2,0
        	
        	loop3:
			lw $t7,($t0)
			lw $t8,($t1)
			mul $t7,$t7,$t8
			add $t6,$t6,$t7
			add $t0,$t0,4
			add $t1,$t1,4
			addi $t2,$t2,1
			
        		blt   $t2,$t3,loop3
        	
        	sw $t6,dotproduct
        	li $v0, 4       		 # Printing message 4
        	la $a0, msg4    
        	syscall         
        	lw $t9, foobar
        	
        	li $v0, 1			#Print the dot product
		move $a0,$t6
		syscall	
