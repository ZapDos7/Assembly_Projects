	.text
	.globl __start
main:
read_int:li $v0,5
		syscall
		move $t2, $v0
	#the decimal number is $t2 (decimal to octal)
    li $t6,0 #remainder
    li $t7,0 #final octal number
    li $t8,1 #placeInNumber
    li $t5,8
    decimaltooctalLoop:
    	div $t2, $t5
    	mfhi $t6		#remainder
        mflo $t2
        mul $t6,$t6,$t8
        add $t7,$t7,$t6
        mul $t8,$t8,10
        bnez $t2,decimaltooctalLoop
        
        
        
	#t7 is the register with the octal number which is converted to decimal (octal to decimal)
	li $t5,10
	move $t2,$t7
    octaltodecimalLoop:    
		div $t2,$t5
		mflo $t2
        mul $t2,$t2,2
        sub $t7,$t7,$t2
		bnez $t2,octaltodecimalLoop

Exit: li $v0,10	
		syscall