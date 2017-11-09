	.text
		.globl __start
__start:
	la $t2,str
	li $t1,0
Char:	lb $t0,($t2)
	beq $t1,8,Change
	beqz $t0,star
	move $a0,$t0
	li $v0,11
	syscall
	add $t1,$t1,1
	add $t2,1
	j Char
	
Change:	move $a0,$t0
	li $v0,11
	syscall
	
	la $a0,enl
	li $v0,4
	syscall

	li $t1,0
	j Char
	
star:	la $t2,str
	lb $t0,($t2)
	j Char
	
	li $v0,10
	syscall
.data
str:	.asciiz	"abcdefghi"
enl:	.asciiz	"\n"
