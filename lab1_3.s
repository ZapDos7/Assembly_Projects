#################################################
#												#
#				text segment					#
#												#
#################################################

	.text
	.globl __start 

main:	la $t7,W
	#lbu $t0,1($t7)
	#lbu $t1,2($t7)
	#lbu $t2,3($t7)

	#2nd seg of the exercise
	#la $t3,Dseg
	#lw $t0,0($t3)

	#la $t3,Dh+2	##Ti 8a givei av balouv +3???	
	#lhu $t1,0($t3)

	#3rd seg of the exercise
	#la $t3,Dseg
	#ulw $t0,0($t3)

	#la $t3,Dh+1		
	#ulh $t1,0($t3)

	li $v0,10
	syscall			# au revoir...

#################################################
#												#
#				data segment					#
#												#
#################################################

	.data
	#3rd seg of the exercise
	#.align	0
	########################
B1:	.byte 	0x01
	.byte 	0x02
	.byte 	0x03
	.byte 	0x04
	#2nd seg of the exercise
Dh:	
	.byte	0x05
	.half	0x6677
	########################
B2:	.byte 	0x81
	.byte 	0x82
	.byte 	0x83
	.byte 	0x84
W:
	.word	0x12345678
	.word	0x87654321
	.word	0
#################################################
#												#
#				End of File						#
#												#
#################################################
