.data
	string: .asciiz "abcdefghijklmnopqrst"
	prompt: .asciiz "\n give a number: \n"

.text
	_main:
		la $s0,string
		_loop:
			li $v0,4
			la $a0,prompt
			syscall
			# read index from console
			li $v0,5
			syscall
			move $t0,$v0
			beq $t0, $zero, _exit
			add $t1, $s0, $t0 # address of wanted char
			lb $a0, 0($t1)
			li $v0,11
			syscall
			j _loop
			_exit:
				li $v0,10
				syscall
