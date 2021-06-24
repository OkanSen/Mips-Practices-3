la $a0, string1

li $v0, 4
syscall

la $s0, string2

sb $s0, 0($a0)
addi $a0, $a0, 1

li $v0, 4
syscall

subi $a0, $a0, 1

li $v0, 4
syscall









.data
string1: 		.asciiz "123"
string2:		.asciiz "9"