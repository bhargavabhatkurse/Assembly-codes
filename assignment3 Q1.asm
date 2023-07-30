.data
str: .asciiz "ABCDEFG"


.text
main:
   
    li $t0, 0      #for maintaining index

loop:
    lb $t1, str($t0)
    beq $t1, 0, exit
    add $t1, $t1, 32     #adding 32  i.e 0x20
    sb $t1, str($t0)
    addi $t0, $t0, 1	#incrementing index
    j loop


exit:
    li $v0, 4
    la $a0, str   #printing
    syscall

    li $v0, 10     #exit
    syscall