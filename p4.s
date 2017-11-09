.text
	.globl __start
__start:

Begin:
	la $s0, string1
	#read int
	li $v0, 5
	syscall
	move $t0, $v0

Check:
	beq $v0, $zero, Exit #if 0, done

Find_Char:
	addi $t0, $t0, 1
	add $t1, $t0, $s0 #address of wanted char

Print_char:
	lb $a0, 0($t1)
#	la $a0, $t1
	li $v0, 11
	syscall

	j Begin

Exit:
	li $v0,10
	syscall

     .data
string1:     .asciiz "abcdefghijklmnopqrst"
char1:		 .asciiz "_"
nl:		     .asciiz "\n"