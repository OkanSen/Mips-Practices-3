# -------------------------
# Okan Sen
# Start of reverseString
#
# -------------------------
la $a0, string1
la $t5, string2
la $a1, string2

la $a2, word


li $t9, 0

li $t8,1
li $t7, 2
jal reverseString



# result comes in $a1

# print a1 address
move $a0, $a1
li $v0, 1
syscall

# end line
la $a0, endl
li $v0, 4
syscall

# load first address of a1 and print
lb $t0, 0($a1)
move $a0, $t0
li $v0, 4
syscall

la $a0, endl
li $v0, 4
syscall

lb $a0, -2($a1)
li $v0, 4
syscall

la $a0, endl
li $v0, 4
syscall

lb $a0, -3($a1)
li $v0, 4
syscall



exit:
	li $v0, 10		# system call to exit
	syscall			# bye bye
# stop execution here by syscall

reverseString:

	
	# save in stack
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	
	move $s0, $a0	# point to string	

	move $t0, $a0
	li $v0, 4
	syscall
	
	lb $t5, 0($a0)	# get byte length
	beq $t5, $zero, exitRevS	# if equals one length get the value
	
	addi $a0, $a0, 1
	
	jal reverseString

	
	# replace each char here
	sb $s0, 0($a1)
	
	
	
	
	addi $a1, $a1, 1
	

	 
	 
exitRevS:
	lw   $ra, 0($sp)        # read registers from stack
        lw   $s0, 4($sp)
        lw   $s1, 8($sp)
        addi $sp, $sp, 12       # bring back stack pointer
        jr $ra	
	


	

.data
string1: 		.asciiz "123"
string2:		.asciiz "abc"
msg1:			.asciiz "Result is: "
endl:			.asciiz "\n"
word:			.space 400

# -------------------------
#
# End of reverseString
#
# -------------------------
