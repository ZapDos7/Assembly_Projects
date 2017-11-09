###################################################
#					 	  #
#		text segment			  #
#						  #
###################################################

#Si Ai Bi	Ci+1
#0  0  0	 0	 
#0  0  1	 1
#0  1  0	 1
#0  1  1	 1
#1  0  0	 0
#1  0  1	 0	
#1  1  0	 0
#1  1  1     1

#Karnaugh map and...Ci+1= Si'Bi + Si'Ai + AiBi

	.text		
     	.globl __start
__start:
	#$t0 --> Ai
	#$t1 --> Bi
	#$t2 --> Si
    addi $t0,0xffffffff
    addi $t1,0xffffffff
	#creating Si
	addu $t2,$t1,$t0
	
	#clear the contents of the regs
	#and "play" with their least
	#significant bit
	srl $t0,$t0,31
	
	srl $t1,$t1,31
	
	srl $t2,$t2,31

	#creating Si'
	li $t3, 1
	xor $t2,$t2,$t3

	#Si'Bi
	and $t4,$t2,$t1
	
	#Si'Ai
	and $t5,$t2,$t0
	
	#AiBi
	and $t6,$t0,$t1
	
	#si'Bi + Si'Ai
	or $t7,$t4,$t5

	#(Si'Bi + Si'Ai) + AiBi	
	or $t7,$t7,$t6

	li $v0, 10
	syscall		#au revoir

#################################################
#			 			#
#     	 	data segment			#
#						#
#################################################

	.data

