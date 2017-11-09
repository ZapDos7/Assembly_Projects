#DEFAULT#
#TEXT#
.text
    .globl __start
__start:
	
	la $t0, num
	lw $t1, 0($t0)
	lw $t2, 4($t0)
	lw $t3, 8($t0)
	lw $t4, 12($t0)
	lw $t5, 16($t0)
	lw $t6, 20($t0)	
	
#tupwse	1o ginomeno
	mult $t1, $t2
	mflo $t7
	mfhi $t8
	move $a0, $t8
	li $v0, 1
	syscall
	move $a0, $t7
	syscall
	la $a0,endl		
	li $v0,4
	syscall	
	
	multu $t1, $t2
	mflo $t7
	mfhi $t8
	move $a0, $t8
	li $v0, 1
	syscall
	move $a0, $t7
	syscall
	la $a0,endl		
	li $v0,4
	syscall	
	
	
	########
	mult $t3, $t4
	mflo $t7
	mfhi $t8
	move $a0, $t8
	li $v0, 1
	syscall
	move $a0, $t7
	syscall
	la $a0,endl		
	li $v0,4
	syscall	
	
	multu $t3, $t4
	mflo $t7
	mfhi $t8
	move $a0, $t8
	li $v0, 1
	syscall
	move $a0, $t7
	syscall
	la $a0,endl		
	li $v0,4
	syscall	
	#######
	mult $t5, $t6
	mflo $t7
	mfhi $t8
	move $a0, $t8
	li $v0, 1
	syscall
	move $a0, $t7
	syscall
	la $a0,endl		
	li $v0,4
	syscall	
	
	multu $t5 $t6
	mflo $t7
	mfhi $t8
	move $a0, $t8
	li $v0, 1
	syscall
	move $a0, $t7
	syscall
	la $a0,endl		
	li $v0,4
	syscall	
	

aurevoir:	
	li $v0 10
	syscall

#DATA#
.data

num:  .word 0x0000000a, 0x00000008, 0x00000002, 0xffffffff, 0x80000000, 0x80000000
endl: .asciiz "\n"

#END#
