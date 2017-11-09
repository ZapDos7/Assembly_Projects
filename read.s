.data
	prompt: .asciiz "\nEnter a number: \n"
	pos: .asciiz "POS\n"
	negat: .asciiz "NEG\n"
.text
	_main:

		_loop:
			# prompt user
			li $v0,4
			la $a0,prompt
			syscall
			# read input
			li $v0,5
			syscall
			# store input in register
			move $t0, $v0
			bgt $t0,$zero,_positive
			blt $t0,$zero,_negative
			# if zero exit
			_exit:
				li $v0,10
				syscall
			_positive:
				li $v0,4
				la $a0,pos
				syscall
				j _loop
			_negative:
				li $v0,4
				la $a0,negat
				syscall
				j _loop