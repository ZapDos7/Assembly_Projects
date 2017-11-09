#################################################
#	                                        #
# lab4_2a.s			                #
# stack exercise 2 	(to be completed)       #
#					        #
#################################################
	.text		
       	.globl __start 
__start:			# execution starts here

# start of main program

	la $a0,prompt		
	li $v0,4
	syscall			# display "Enter integer number :"		
	li $v0,5
	syscall			# read integer
	move $t0,$v0
	la $a0,endl		
	li $v0,4
	syscall			# display end of line
	move $a0,$t0
	
	jal proc
	
	li $v0,10		
	syscall			# exit 
# end of main program

# start of procedure
proc:	addi $sp,$sp,-8
	sw $ra,0($sp)
	sw $a0,4($sp)
	#move $t1,$a0
	
	
	#move $a0,$t1
	slti $t0,$a0,1		#check if $a0 is zero
	bne $t0,$zero,L1	#if $a0 < 1 (aka 0) then goto L1

 	addi $a0,$a0,-1
	jal proc

L1:	lw $a0,4($sp)
	li $v0, 1
	syscall
	la $a0,endl		
	li $v0,4
	syscall			# display end of line
	
	lw $ra,0($sp)
	addi $sp,$sp,8
	jr $ra
# end of procedure	

		.data
prompt:		.asciiz "Enter integer number :"
endl:		.asciiz "\n"
#################################################
#                                               #
# End of program		                # 
#					        #
#################################################
