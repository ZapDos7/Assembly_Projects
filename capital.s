.data
	string: .asciiz "aAbBcCdDeE"
	prompt: .asciiz "\nGive a char: \n"
	nl: .asciiz "\n"

.text
	_main:
		la $s0, string
		li $s1,'a'
		li $s3,'A'
		li $s7,10 # str len

		_loop:
			li $v0,4
			la $a0, prompt
			syscall
			li $v0,12
			syscall
			move $t0,$v0
			beq $t0, $s1, _lowercase
			beq $t0, $s3, _uppercase
			# if not a/A exit
			li $v0,10
			syscall

			_lowercase:
				li $t8,'a'
				li $t9,'z'
				j _print_str
			_uppercase:
				li $t8,'A'
				li $t9,'Z'
				j _print_str

			_print_str:
				# print a new line 
				li $v0,4
				la $a0,nl
				syscall
				li $t1,0 # str loop counter
				_str_loop:
					beq $t1, $s7, _str_loop_end
					# read current char
					add $t2, $t1, $s0
					lb $t3, ($t2)
					# if t3 in bounds print 
					blt $t3,$t8,_skip
					bgt $t3,$t9,_skip
					li $v0,11
					la $a0,($t3)
					syscall
					_skip:
					addi $t1, $t1, 1
					j _str_loop
				_str_loop_end:	
				j _loop