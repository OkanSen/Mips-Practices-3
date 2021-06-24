# -------------------------
# Okan Sen
# Start of checkPattern
#
# -------------------------
	la $a0, msg1
	li $v0, 4
	syscall

	li $v0, 5
	syscall

	move $t0, $v0	# keep the pattern in t0 for now
	#li $t1, 1
	#sllv $t0, $t0, $t1

	la $a0, msg2
	li $v0, 4
	syscall

	li $v0, 5
	syscall

	move $a1, $v0	# put value in a1

	la $a0, msg3
	li $v0, 4
	syscall

	li $v0, 5
	syscall

	move $a2, $v0	# put n in a2

	move $a0, $t0	# now put pattern in a0 before method

	move $a0, $t0
	li $v0, 1
	syscall

	jal checkPattern


	# result comes in $v0



	exit:
		li $v0, 10		# system call to exit
		syscall			# bye bye
	# stop execution here by syscall


	checkPattern:
		
		

	


.data

msg1:			.asciiz "Enter the pattern to be searched: "
msg2:			.asciiz "Enter the number to be searched: "
msg3:			.asciiz "Enter a number for n, which will divide the number into patterns: "

endl:			.asciiz "\n"

# -------------------------
#
# End of checkPattern
#
# -------------------------
