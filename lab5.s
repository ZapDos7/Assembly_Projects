#################################################
#												#
#				text segment					#
#												#
#################################################

	.text
	.globl __start
__start:		
print_zero_mess:	la $a0, zero
					jal print_string

print_zero:			l.s $f12, zer_f
					jal print_float	
					jal printEndl
							
print_m_inf_mess:	la $a0, inf_m
					jal print_string

print_m_inf:		l.s $f12, m_inf
					jal print_float	
					jal printEndl
							
print_p_inf_mess:	la $a0, inf_p
					jal print_string

print_p_inf:		l.s $f12, p_inf
					jal print_float	
					jal printEndl
							
print_NaN_mess:		la $a0, mess_nan
					jal print_string

print_NaN:			l.s $f12, nan
					jal print_float	
					jal printEndl
							
print_mess_not_def:	la $a0, mess_not_def
					jal print_string

print_not_def:		l.s $f12, not_defined
					jal print_float	
					jal printEndl
							
print_mess_inf_m_2:	la $a0, mess_inf_m_2
					jal print_string
							
print_mess_m_nan_1:		la $a0, mess_m_nan_1
					jal print_string

print_minus_nan_1:	l.s $f12, minus_nan_1
					jal print_float	
					jal printEndl
							
print_mess_m_nan_2:		la $a0, mess_m_nan_2
					jal print_string

print_minus_nan_2:	l.s $f12, minus_nan_2
					jal print_float	
					jal printEndl
							
print_mess_m_nan_3:		la $a0, mess_m_nan_3
					jal print_string

print_minus_nan_3:	l.s $f12, minus_nan_3
					jal print_float	
					jal printEndl
							
print_mess_m_nan_4:		la $a0, mess_m_nan_4
					jal print_string

print_minus_nan_4:	l.s $f12, minus_nan_4
					jal print_float	
					jal printEndl
							
print_mess_m_nan_5:		la $a0, mess_m_nan_5
					jal print_string

print_minus_nan_5:	l.s $f12, minus_nan_5
					jal print_float	
					jal printEndl
							
print_mess_m_nan_6:		la $a0, mess_m_nan_6
					jal print_string

print_minus_nan_6:	l.s $f12, minus_nan_6
					jal print_float	
					jal printEndl					
			
Exit:				li $v0, 10
					syscall	
					
print_string: 	li $v0, 4
				syscall
				jr $ra
print_float:	li $v0, 2
				syscall
				jr $ra
printEndl:      la $a0, Endl
				li $v0, 4
				syscall	
				jr $ra	
.data 
zero:		.asciiz "Zero:"
inf_m:		.asciiz "Minus infinite:"
inf_p:		.asciiz "Plus infinite:"
mess_nan:	.asciiz "NaN:"
mess_not_def:	.asciiz "Not defined:"
mess_inf_m_2:	.asciiz "Minus infinite 2:"
mess_m_nan_1:	.asciiz "Minus NaN 1:"
mess_m_nan_2:	.asciiz "Minus NaN 2:"
mess_m_nan_3:	.asciiz "Minus NaN 3:"
mess_m_nan_4:	.asciiz "Minus NaN 4:"
mess_m_nan_5:	.asciiz "Minus NaN 5:"
mess_m_nan_6:	.asciiz "Minus NaN 6:"
zer_f:   .float 0.0
m_inf:   .word 0xff800000
p_inf:   .word 0x7f800000
nan:     .word 0x7fffffff
minus_nan_1:	 .word 0xff900000
minus_nan_2:	 .word 0xffa00000
minus_nan_3:	 .word 0xffb00000
not_defined:	 .word 0xffc00000
minus_nan_4:	 .word 0xffd00000
minus_nan_5:	 .word 0xffe00000
minus_nan_6:	 .word 0xfff00000
x:       .float 55.0
y:       .float -55.0
Endl: .asciiz "\n"
