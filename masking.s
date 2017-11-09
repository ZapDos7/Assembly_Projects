.text
.globl _start

_start:
		
		li $s1, 127
		and $s1, $s1, 0x0000000f
		
		li $v0, 10
		syscall
		
.data
		