# -------------------------
# Okan Sen
# Start of recursiveSummation
#
# -------------------------
la $a0, number


move $t0, $a0


jal recursiveSummation
# result comes in $v0
	move $a1, $a0
	move $t0, $v0
	
	la $a0, msg1
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall


exit:
	li $v0, 10		# system call to exit
	syscall			# bye bye
# stop execution here by syscall

recursiveSummation:
	# Basically, stores all chars in stacks,
	# when the last string char is reached, pop all the stacks
	# convert each char into integers and add them in another stack
	# a0 = string
	# if (string.length() == 1) return Value
	#return RS(string-1)
	
	# save in stack
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	
	move $s0, $a0	# point to string
	
	lb $t5, 0($a0)	# get byte length
	beq $t5, $zero, zeroVal	# if equals one length get the value
	
	addi $a0, $s0, 1
	
	jal recursiveSummation
	
	 add $s1, $zero, $v0         # $s1 = SR(str - 1)
	 
	 jal returnVal
	 
	 add $v0, $v0, $s1
	
exitRS:
	lw   $ra, 0($sp)        # read registers from stack
        lw   $s0, 4($sp)
        lw   $s1, 8($sp)
        addi $sp, $sp, 12       # bring back stack pointer
        jr $ra
	
returnVal:	
	lbu $t1, ($s0)
	addi $t1, $t1, -48
	add $v0, $v0, $t1
	j exitRS
	
zeroVal:
	j exitRS
	
	



.data
number: 		.asciiz "12"

msg1:			.asciiz "Result is: "
endl:			.asciiz "\n"

# -------------------------
#
# End of recursiveSummation
#
# -------------------------
