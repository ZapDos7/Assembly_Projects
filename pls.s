.text
	.globl __start
__start:

Begin:
	li $v0, 6 #read real
	syscall #$f0 o float m

	mov.s $f1, $f0 #o f1 ein o input m

Print1:
	la $a0, msg
	li $v0, 4
	syscall
	mov.s $f12, $f1
	li $v0, 2
	syscall
	la $a0, nl
	li $v0, 4
	syscall
	mov.s $f12, $f1

Check:
	l.s $f6, zer
	c.eq.s $f1, $f6
	bc1t Exit

Down:
	l.s $f2, n1 	# $f2 = 1000.0
	c.lt.s $f1, $f2 #if true dld if X<1000
	bc1t Out

Up:
	l.s $f3, n2	# $f3 = 1999.0
	c.lt.s $f3, $f1 #if true dld if 1999<X
	bc1t Out

In:
	la $a0, mes1
	li $v0, 4
	syscall #print in range
	la $a0, nl
	syscall
	j Begin

Out:
	la $a0, mes2
	li $v0, 4
	syscall #print out of range
	la $a0, nl
	syscall
	j Begin

Exit:
	li $v0,10
	syscall

     .data
nl:		.asciiz "\n"
msg:	.asciiz "You number is "
n1:		.float 1000.0
n2:		.float 1999.0
zer:	.float 0.0
mes1:	.asciiz "In range"
mes2:	.asciiz "Out of range"

#read real Χ < console
#infinite
#when X ανήκει 1000-1999 (και ακρα) => πριντ "in range"
#else out of range
#end when 0 input
#aplis akriveias