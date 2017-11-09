###################################################
#					 	  #
#		text segment			  #
#						  #
###################################################

	.text		
     	.globl __start
__start:	
	li $t6, 0x12345678
	#place byte 3 at $t0
	srl $t0,$t6,24	
	#get byte 2 and place it to $t1
	li $t5, 0xff0000
	and $t1, $t6, $t5
	srl $t1,$t1,8	
	and $t2,$t6,0xff00
	sll $t2,$t2,8
	sll $t3,$t6,24
	or $t4, $t0, $t1
	or $t5, $t2, $t3
	or $t7, $t4, $t5

	li $v0, 10
	syscall		#au revoir		

#################################################
#			 			#
#     	 	data segment			#
#						#
#################################################

	.data
