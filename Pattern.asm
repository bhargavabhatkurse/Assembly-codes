# PATTERN
.data
msg1:   .asciiz " "
	.extern foobar 4
msg2: 	.asciiz "*"
	.extern foobar 4
msg3: 	.asciiz "\n"
	.extern foobar 4
	
	size: .word 5
.text
	main:
		li $t0,1		# i = 1
		li $t1,1		# j = 2*1 - 1 = 1
		lw $t3,size
		li $t8,1
		
		loop1:
			li $t2,1		# k = 1
			sub $t5,$t3,$t0		#$t5 = size - i
			loop2:
				li $v0, 4       	# Printing spaces
       				la $a0, msg1     
        			syscall         
        			lw $t9, foobar
        				
        			addi $t2,$t2,1
				ble $t2,$t5,loop2
				
			add $t1,$t0,0		# j = 2*i - 1
			mul $t1,$t1,2
			sub $t1,$t1,1
			loop3:	
				li $v0, 4       # Printing *
       				la $a0, msg2     
        			syscall         
        			lw $t9, foobar
        				
        			sub  $t1,$t1,1
				ble $t8,$t1,loop3
			
			li $v0, 4       # Printing '\n'
       			la $a0, msg3     
        		syscall         
        		lw $t9, foobar
		
			add $t0,$t0,1
		ble $t0,5,loop1
		li $v0, 1		 
		move $a0,$t0
		#syscall	
		