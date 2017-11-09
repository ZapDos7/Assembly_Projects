###################################################
#					 	  #
#		text segment			  #
#						  #
###################################################

	.text		
     	.globl __start
__start:
	li $v0,5
	syscall			# read number
	move $t0,$v0
	
	la $a0,endl	#newline
	li $v0,4
	syscall

	li $s0,2
	li $s1,5
	li $s2,10

	la $a1,theEnd

	div $t0,$s0
	mfhi $t1	#storing the remainder to a temp reg

	bne $t1,$zero,div5 #if not div 2, avoid message

	la $a0,by2	#if div 2, display message 
	li $v0,4
	syscall

	la $a0,endl	#newline
	li $v0,4
	syscall

	jr $a1		#break
	

div5:	div $t0,$s1
	mfhi $t1	#storing the remainder to a temp reg

	bne $t1,$zero,div10 #if not div 5, avoid message

	la $a0,by5	#if div 5, display message 
	li $v0,4
	syscall
	addi $t3,$t3,1

	la $a0,endl	#newline
	li $v0,4
	syscall

	jr $a1		#break

div10:	div $t0,$s2
	mfhi $t1	#storing the remainder to a temp reg

	bne $t1,$zero,nothing #if not div 2, avoid message

	la $a0,by10	#if div 2, display message 
	li $v0,4
	syscall
	addi $t3,$t3,1
	
	la $a0,endl	#newline
	li $v0,4
	syscall

	jr $a1		#break

nothing: la $a0,noth	#print that it is not divided by 2,5,10
	li $v0,4
	syscall	

theEnd: li $v0,10
	syscall			# au revoir
	

#################################################
#			 			#
#     	 	data segment			#
#						#
#################################################

	.data
by2:	.asciiz "Divided by 2"
by5:	.asciiz "Divided by 5"
endl:		.asciiz "\n"
by10:	.asciiz "Divided by 10"
noth:	.asciiz "It is not divided by any of the 2,5,10"
