#Να γράψετε ένα πρόγραμμα στο οποίο αν θα εισάγουμε τον χαρακτήρα 'a' θα μας εμφανίζει μια συμβολοσειρά (στο τμήμα data), η οποία έχει κεφαλαία ΚΑΙ μικρά μέσα, μόνο με μικρά, ενώ αν εισάγουμε τον χαρακτήρα 'A', θα την εμφανίζει μόνο με κεφαλαία.

.text
	.globl __start
__start:

ReadChar:
	la $a0, char
	addi $a1, $zero, 1
	li $v0, 8
	syscall
	#ston a0 ein to input
	move $s0, $a0
	#now in s0

	la $s3, string

	la $s1, smol
	la $s2, big

	addi $t0, $zero, 1

	beq $s0, $s1, IsSmol
	beq $s0, $s2, IsBig
	j Exit

IsSmol:
	SmolLoop:
		#for each char in string check if lowercase

		lb $a0, 0($t0)
		move $t1, $a0
		sub $t2, $t1, $s0 # bgale to 'A' and compare with 'Z' - 'A' = 90-65 = 25
		la $a0, diff
		bge $t2, $a0, #an ein > tou 25, 




IsBig:


Exit:
	li $v0,10
	syscall

     .data
nl:     .asciiz "\n"
#char:	.asciiz "_"
char:	.space 1
diff:	.byte 25
smol:	.asciiz "a"
big:	.asciiz "A"
string:	.asciiz "aBcDeFgH"