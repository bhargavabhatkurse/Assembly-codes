# SELECTION SORT
.data
msg:		.asciiz "The sorted array is:\n"
		space :.asciiz " "
                array: .word 99, 23, 45, 82, 09, 34, 71, 64, 88, 42, 12, 87, 33, 36, 83, 18, 17, 04, 52, 46
                size: .word 20
                
.text
main:
                la $a0,array						# $a0 = array[0] 
                lw $a1,size						# $a1 = size
                jal sort						# call the function sort. the parameters are $a0 and $a1

# Sort function
sort:
                move $a2,$a1 # $a2=n (size)
                sub $a1,$a1,1 # $a1=n-1 (size - 1)
                li $t0,0 # i=0
                forLoop1:
                                # if i=n-1, exit loop ,
                                beq $t0,$a1,exit
                                move $s0,$t0 # argmin=i
                                move $t1,$t0 #j=i
                forLoop2:
                                add $t1,$t1,1 # j=i+1
                                bne $t1,$a2, compare
                                j swap
                compare:
                                li $t2,4
                                mul $t3,$t2,$t1
                                add $t3,$t3,$a0
                                mul $t4,$t2,$s0
                                add $t4,$t4,$a0
                                lw $t5,0($t3) # t5=array[j]
                                lw $t6,0($t4) # t6=array[argmin]
                                slt $t7,$t5,$t6 # set $t7=1, if $t5<$t6
                                bne $t7,1,forLoop2 # if $t7 is not eqaul to 1
                                move $s0,$t1 # other wise set argmin=j
                                j forLoop2 # goto forLoop2
                               
swap:
                # swap array[i] and array[argmin]
                li $t2,4
                mul $t3,$t2,$t0
                add $t3,$t3,$a0
                lw $t5,0($t3) # t5=array[i]
                mul $t4,$t2,$s0
                add $t4,$t4,$a0
                lw $t6,0($t4) # t6=array[argmin]
                sw $t5,($t4)
                sw $t6,($t3)
                add $t0,$t0,1
                j forLoop1
exit:
	        la $a0,msg
                li $v0,4
                syscall
                
                #print the array after sorting
                la $a0,array
                lw $a1,size
                #store the value of $a0 into $s0
                move $s0,$a0
                li $t0,0 # i=0


		
                #loop to print the array
                printloop:
                                #if the value of $t0 is equal to size
                                #then end the program.
                                beq $t0,$a1,End
                                #print value of array
                                lw $a0,0($s0) # $a0=array[i]
                                li $v0,1
                                syscall
                                #print new line
                                la $a0,space
                                li $v0,4
                                syscall
                                addi $s0, $s0, 4 #increment by 4
                                add $t0,$t0,1 # i=i+1
                                j printloop # goto lable printloop
                End:
                                # exit program
                                li $v0,10
                                syscall
                
