#################################################
#												#
#				text segment					#
#												#
#################################################

	.text
	.globl main
	
	#read first int and move it to a temp reg
main:	li		$v0, 5
	syscall
	move	$t0, $v0

	la		$a0,endl 	# system call to print
	li		$v0, 4 		# out a newline
	syscall

	#read second int and move it to a temp reg
	li		$v0, 5
	syscall
	move	$t1, $v0

	la		$a0, endl	# system call to print
	li		$v0, 4 		# out a newline
	syscall

	#make calculations
	add 	$t3, $t0, $t1
	sub 	$t4, $t0, $t1

	#print the sum
	move 	$a0, $t3
	li 		$v0, 1
	syscall

	la 		$a0, endl 	# system call to print
	li 		$v0, 4 		# out a newline
	syscall

	#print the diff
	move 	$a0, $t4
	li 		$v0, 1
	syscall

	li 		$v0, 10
	syscall				#au revoir...

#################################################
#			 			#
#     	 	data segment			#
#						#
#################################################

	.data
endl: 	.asciiz 	"\n"
