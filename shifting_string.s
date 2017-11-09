.globl _start

.text

_start:
	la $s0,W
	li $a1,8
	move $a0,$s0
	li $s3,0
	li $s4,10
	la $s5,endl
Loop:
	lb $t0,0($s0)
	lb $t1,7($s0)
	lb $t2,6($s0)
	lb $t3,5($s0)
	lb $t4,4($s0)
	lb $t5,3($s0)
	lb $t6,2($s0)
	lb $t7,1($s0)
	sb $t0,7($s0)
	sb $t1,6($s0)
	sb $t2,5($s0)
	sb $t3,4($s0)
	sb $t4,3($s0)
	sb $t5,2($s0)
	sb $t6,1($s0)
	sb $t7,0($s0)
	move $a0,$s0
	li $v0,4
	syscall
	la $a0,endl
	li $v0,4
	syscall
	addi $s3,$s3,1
	jal Loop
	#bne $s4,$s3,Loop
	#jal Exit	
Exit:
	li $v0,10
	syscall
		
.data
W:	.asciiz "abcdefgh"
endl:   .asciiz"\n"