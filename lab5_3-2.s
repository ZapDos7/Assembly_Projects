#################################################
# 						            #
# lab5_3a.s					            #
# Float factorial			            #
#						            #
#################################################
	.text		
       	.globl __start 
__start:			
	l.s $f0, n	# $t0 = n
	li.s $f2, 1.0	# $f2 index i=1..n
	li.s $f1, 1.0	# $f1 contains i!
loop:	mul.s $f1,$f1,$f2
	mov.s $f12,$f2
	jal print_float
	
	la $a0,msg1	
	jal print_str
	
	mov.s $f12,$f1
	jal print_float
	
	la $a0,endl		
	jal print_str
	
	li.s $f3, 1.0
	add.s $f2,$f2,$f3	# i=i+1
	
	c.le.s $f2, $f0
	bc1t      loop
	#ble $t2,$t0,loop	# repeat if i<=n
	
	li $v0,10		# exit
	syscall	
	
print_float: 	li $v0,2
		syscall		# display i
		jr $ra
		
print_str:	li $v0,4
		syscall		# display "! is :"
		jr $ra
		.data
n:		.float 50.0
msg1:		.asciiz "! is :"
endl:		.asciiz "\n"

#################################################
# 						            #
# End of program					      # 
#					             	#
#################################################

