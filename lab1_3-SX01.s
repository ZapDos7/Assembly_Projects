#################################################
#												#
#				text segment					#
#												#
#################################################

	.text
	#.globl __start 

main:
	la $t7,Dh
	lbu $t6,0($t7)
	la $t7,Dseg2+4
	sb $t6 ($t7)	

	li $v0,10
	syscall			# au revoir...

#################################################
#												#
#				data segment					#
#												#
#################################################

	.data
	
Dh:	.byte 	0x01
	.byte 	0x02
	.byte 	0x03
	.byte 	0x04
	.byte 	0x81
	.byte 	0x82
	.byte 	0x83
	.byte 	0x84
	.word	0x12345678
Dseg2:	.word	0x87654321
	.word	0
#################################################
#												#
#				End of File						#
#												#
#################################################
