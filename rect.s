#########################################################################
#   Description:
#
#   Modification history:
#   Date        Name        Modification
#   2010-12-16  Jason Bacon Begin
#########################################################################

#########################################################################
#   System call constants
#########################################################################

SYS_PRINT_INT       =   1
SYS_PRINT_FLOAT     =   2
SYS_PRINT_DOUBLE    =   3
SYS_PRINT_STRING    =   4
SYS_READ_INT        =   5
SYS_READ_FLOAT      =   6
SYS_READ_DOUBLE     =   7
SYS_READ_STRING     =   8
SYS_SBRK            =   9
SYS_EXIT            =   10
SYS_PRINT_CHAR      =   11
SYS_READ_CHAR       =   12

#########################################################################
#   Main program
#########################################################################

# Variables for main
	.data
	.align 2    # Put next label on a word boundary
length:         .word   0
width:          .word   0
area:           .word   0

length_prompt:  .asciiz "Please enter the length of the rectangle: "
width_prompt:   .asciiz "Please enter the width of the rectangle: "
area_msg:       .asciiz "The area of the rectangle is "
period_nl:      .asciiz ".\n"

# Main body
	.text
main:
	# Input length
	li      $v0, SYS_PRINT_STRING
	la      $a0, length_prompt
	syscall
	
	li      $v0, SYS_READ_INT
	syscall
	sw      $v0, length
	
	# Input width
	li      $v0, SYS_PRINT_STRING
	la      $a0, width_prompt
	syscall
	
	li      $v0, SYS_READ_INT
	syscall
	sw      $v0, width
	
	# Compute area
	lw      $t0, length
	lw      $t1, width
	mul     $t0, $t0, $t1
	sw      $t0, area
	
	# Print area
	li      $v0, SYS_PRINT_STRING
	la      $a0, area_msg
	syscall
	
	li      $v0, SYS_PRINT_INT
	lw      $a0, area
	syscall
	
	li      $v0, SYS_PRINT_STRING
	la      $a0, period_nl
	syscall
	
	# Return to calling program
	jr      $ra