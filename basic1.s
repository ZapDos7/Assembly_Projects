.text
	.globl __start
__start:

	la $s0, boi #buffer
	li $a1,4	#size of string
	move $a0,$s0#buffer
	li $s3,0
	li $s4,4
	la $s5,nl
	la $s1,star #*

Loop1:
	lb $t0,0($s0)
	lb $t1,1($s0)
	lb $t2,2($s0)
	lb $t3,3($s0)

	sb $t0,0($s1)
	sb $t1,1($s0)
	sb $t2,2($s0)
	sb $t3,3($s0)

	li $v0,4
	syscall
	la $a0,nl
	li $v0,4
	syscall
	addi $s3,$s3,1
	
Loop2:
	lb $t0,0($s0)
	lb $t1,1($s0)
	lb $t2,2($s0)
	lb $t3,3($s0)

	sb $t0,0($s0)
	sb $t1,1($s1)
	sb $t2,2($s0)
	sb $t3,3($s0)

	li $v0,4
	syscall
	la $a0,nl
	li $v0,4
	syscall
	addi $s3,$s3,1
	
Loop3:
	lb $t0,0($s0)
	lb $t1,1($s0)
	lb $t2,2($s0)
	lb $t3,3($s0)

	sb $t0,0($s0)
	sb $t1,1($s0)
	sb $t2,2($s1)
	sb $t3,3($s0)

	li $v0,4
	syscall
	la $a0,nl
	li $v0,4
	syscall
	addi $s3,$s3,1
	
Loop4:
	lb $t0,0($s0)
	lb $t1,1($s0)
	lb $t2,2($s0)
	lb $t3,3($s0)

	sb $t0,0($s0)
	sb $t1,1($s0)
	sb $t2,2($s0)
	sb $t3,3($s1)


	li $v0,4
	syscall
	la $a0,nl
	li $v0,4
	syscall
	addi $s3,$s3,1
	jal Loop1

Exit:
	li $v0,10
	syscall

     .data
star:	.asciiz "*"
boi:	.asciiz "abcd"
nl:     .asciiz "\n"


#παίρνεις ένα string (δεν ξέρω πως, από κονσόλα ή data), έστω το ''abcd'' και εκτυπώνεις το εξης: *bcd a*cd ab*d abc*