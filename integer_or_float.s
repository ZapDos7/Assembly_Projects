.data
    isaker: .asciiz "Einai akeraios"
    isfloat: .asciiz "Einai dekadikos"
.text
    li $v0,6
    syscall
   
    cvt.s.w $f1,$f0
    cvt.w.s $f2,$f1
    c.eq.s $f2,$f0
    bc1t float
   
   
    la $a0,isfloat
    li $v0,4
    syscall
    j exit
   
float:  la $a0,isaker
    li $v0,4
    syscall
   
   
exit:   li $v0,10
    syscall