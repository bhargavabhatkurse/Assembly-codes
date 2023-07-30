.data
string: .asciiz "in a hole in the ground    there lived a     hobbit"


.text
main:
   
    li $t0, 0      #for maintaining index
    la $s2, ' '    # space
   

loop:
    lb $a0, string($t0)    #loading byte
    beq $t0, 0, capitalise_first     #to capitalise the first letter
    return:
    addi $t0, $t0, 1		#incrementing
    beq $a0, 0, exit		
    beq $a0, $s2, capitalise	#capitalising the first letter of every word after space
    return_here:
    j loop

capitalise: 
	    lb $s0,string($t0)
	    beq $s0,$s2,return_here   #if the next character is space as well, return
	    sub $s0, $s0, 32     #subtracting 32  i.e 0x20
            sb $s0, string($t0)
            j return_here

capitalise_first: 
	    	lb $s0,string($t0)
	    	sub $s0, $s0, 32     #subtracting 32  i.e 0x20
            	sb $s0, string($t0)
            	j return
exit:
    li $v0, 4
    la $a0, string   #printing
    syscall

    li $v0, 10     #exit
    syscall