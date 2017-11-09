#################################################
#												#
#				text segment					#
#												#
#################################################

	.text
	#.globl __start 

	#5rd seg of the exercise
main:	la $t6,Dh
	sb $t6 (Dseg2+4)

	li $v0,10
	syscall			# au revoir...

#################################################
#												#
#				data segment					#
#												#
#################################################

	.data
	#3rd seg of the exercise
	.align	0
	########################
	.byte 	0x01
	.byte 	0x02
	.byte 	0x03
	.byte 	0x04
	#2nd seg of the exercise
Dh:	
	#.byte	0x05
	#.half	0x6677
	########################
	.byte 	0x81
	.byte 	0x82
	.byte 	0x83
	.byte 	0x84
Dseg:
	.word	0x12345678
Dseg2:
	.word	0x87654321
	.word	0
#################################################
#												#
#				End of File						#
#												#
#################################################
