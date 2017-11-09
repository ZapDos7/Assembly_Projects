    .text
    .globl __start
main:
la $a0,give
li $v0,4
syscall
read_int: li $v0,5
          syscall
move $s0,$v0 #our number
print_int: add $a0, $s0, $zero
            li $v0,1
            syscall
move $t0,$zero #counter for 32bit number
addi $t7,$t7,32
 
addi $t1, $t1, 1
sll $t1, $t1, 31 #maxint
 
move $t2, $zero #counter for ones
move $t3, $zero #counter for zeroes
 
first:move $t4, $s0
      sll $t4, $t4, 31
      addi $t0, $t0, 1
      beq $t4, $t1,onemore
      addi $t3, $t3,1
      j loop
onemore: addi $t2,$t2,1
 
loop: beq $t0,$t7, stop
      srl $s0, $s0, 1
      move $t4, $s0
      sll $t4, $t4, 31
      addi $t0,$t0,1
      beq $t4, $t1,onemoreone
      addi $t3, $t3,1
      j loop
onemoreone: addi $t2,$t2,1
        j loop
       
stop:bne $t2, $t3, next
    la $a0,eq
    li $v0,4
    syscall
    j Exit
next:   bgt $t2,$t3, greaterones
        la $a0,zero
        li $v0,4
        syscall
        j Exit 
greaterones: la $a0,one
            li $v0,4
            syscall
           
 
Exit: li $v0,10
        syscall
       
 
     
    .data
give: .asciiz "Give a number and press enter\n"
one: .asciiz "\n Ones are more\n"
zero: .asciiz "\n Zeroes are more\n"
eq: .asciiz "\n Zeroes and ones are equal"