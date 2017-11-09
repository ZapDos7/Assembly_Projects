###################################################
#					 	  #
#		text segment			  #
#						  #
###################################################

	.text		
     	.globl __start
__start:
read_num:				li $v0,5
						syscall			# read number
						move $t0,$v0
	
print_endl1:			la $a0,endl	#newline
						li $v0,4
							syscall

load_divs:				li $s0,2
						li $s1,3
	 	   				li $s2,5
			   			la $a3, Exit

div2: 					div $t0,$s0
store_remainder_div2:	mfhi $t1	#storing the remainder to a temp reg

if_Not_div2_avoid_message:	bne $t1,$zero,div3 #if not div 2, avoid message

if_div2_print_message:	la $a0,by2	#if div 2, display message 
						li $v0,4
						syscall
						#addi $t3,$t3,1

print_endl2:			la $a0,endl	#newline
						li $v0,4
						syscall

break1:					jr $a3		#break
	

div3:					div $t0,$s1
store_remainder_div3:	mfhi $t1	#storing the remainder to a temp reg

if_Not_div3_avoid_message:	bne $t1,$zero,div5 #if not div 3, avoid message

if_div3_print_message:	la $a0,by3	#if div 3, display message 
						li $v0,4
						syscall
						#addi $t3,$t3,1

print_endl3:			la $a0,endl	#newline
						li $v0,4
						syscall

break2:					jr $a3		#break

div5:					div $t0,$s2
store_remainder_div5:	mfhi $t1	#storing the remainder to a temp reg

if_Not_div5_avoid_message:	bne $t1,$zero,print_Not_divi_by2_3_5 #if not div 5, avoid message

if_div5_print_message:	la $a0,by5	#if div 5, display message 
						li $v0,4
						syscall
						#addi $t3,$t3,1
	
print_endl4:			la $a0,endl	#newline
						li $v0,4
					   	syscall

break3:					jr $a3		#break

#nothing: 				bne $t3,$zero,Exit
	
print_Not_divi_by2_3_5:	la $a0,noth	#print that it is not divided by 2,3,5
						li $v0,4
						syscall	

Exit: 					li $v0,10
						syscall			
	

#################################################
#			 			#
#     	 	data segment			#
#						#
#################################################

	.data
by2:	.asciiz "Divided by 2"
by3:	.asciiz "Divided by 3"
endl:	.asciiz "\n"
by5:	.asciiz "Divided by 5"
noth:	.asciiz "It is not divided by any of the 2,3,5"
