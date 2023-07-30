# LINEAR SEARCH
.data
msg1: 	.asciiz "\nDo you wish to continue\n0.Exit\n1.Continue\n"
msg2:   .asciiz "\nEnter the element to be searched:"
msg3:   .asciiz "\nThe search is unsuccessful"
msg4:	.asciiz "\nThe element is present at index "
msg5:   .asciiz " in the array"
msg6:    .asciiz "\nSearch is over"
	array:.word 50,12,52,-78,03,12,99,32,53,77,47,00
	size: .word 12
	input: .word 1
	element: .space 4
	index: .word 0
.text
	main:
	
	loop1:
		# PROMPING MESSAGE TO USER
		li $v0, 4       			
        	la $a0, msg2    
        	syscall 
        	
        	# GETTTING INPUT FROM USER FOR ITEM TO BE SEACRHED
        	li $v0,5			
		syscall 
		move $t0,$v0
		sw $t0,element
        	
		la $t3,array
		lw $t4,size
		li $t5,0
		
		loop2:
			lw $t6,($t3)
			beq  $t0,$t6,successfull
			addi $t3,$t3,4
			addi $t5,$t5,1
			blt $t5,$t4,loop2
			
		li $v0, 4       			
        	la $a0, msg3   
        	syscall
        	j end
        	
        	successfull:
        		sw $t5,index
        		li $v0, 4       			
        		la $a0, msg4   
        		syscall
        		
        		lw $t9,index
        		li $v0, 1			#Print the index
			move $a0,$t9
			syscall	
        		
        		li $v0, 4       			
        		la $a0, msg5 
        		syscall
        		j end
        	
		end:
			li $v0, 4       			
        		la $a0, msg1 
        		syscall
        		
			li $v0,5			
			syscall 
			move $t2,$v0
			sw $t2,input
			
			bnez $t2,loop1
		
		li $v0, 4       			
        	la $a0, msg6 
        	syscall
