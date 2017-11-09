#DEFAULT#
#TEXT#
.text
    .globl __start
__start:
	
begin:
	la $a0, msg
	la $t0, msg
	la $t1, msg
	li $t3, 0
	li $v0, 4
	syscall
	
print_endline:
	la $a0, endl
	li $v0, 4
	syscall	
	j check_space
	
check_space:
	la $t0, space
	la $a0, char
	li $a1, 2
	li $v0, 8
	syscall 
	move $t4, $a0
	bne $t0, $t4, print_endline
	
	addi $t3, $t3, 1
	la $t2, dottie
	la $a0, msg
	sb $t2, 0($a0)
	li $v0, 4
	syscall
	

aurevoir:	
	li $v0, 10
	syscall

#DATA#
.data

endl: 	 .asciiz "\n"
space:	 .asciiz " "
msg:	 .asciiz "--------------------"
dottie:	 .asciiz "."
char:	 .asciiz "a"

#END#

#exei string 20 chars sto data yolo chars print once OK
#space => neo string alla 1o char ., rest same
#space => teleia sto 2o only
#kok infinite times
