.text
	.globl __start
__start:



Exit:
	li $v0,10
	syscall

     .data
nl:      .asciiz "\n"