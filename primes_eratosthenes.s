#  Prime numbers: The sieve of Eratosthenes.
#  Print the primes in the interval [2,N]:
#  S = {2,3,4,...,N}
#  P = 2;
#  for P = 2 to N do begin
#    if P in S then begin
#      I:=2;
#      while P*I <= N do begin
#        S = S \ {P*I}
#        I = I+1
#      end
#    end
#  end
#  print S

.globl _start

.text

_start:
 li $s0 0xFFFFFFFF            # S($s0) = {0,1,2,3,4,...,31}
     li $t0, 2                  # P($t0) = 2
     li $t2, 31                 # N($t2) = 31
     li $t1, 1                  # the moving "1"
loop:    sllv $t3, $t1, $t0         # set the $t0-th bit of $t3 to 1
     and $t3, $s0, $t3          # P in S ?
     beq $t3, $0, skip          # if no, go to skip

     li $t4, 2                  # I($t4) = 2
loop1:   mul $t5, $t0, $t4          # $t5 = P*I
     bgt $t5, $t2, skip         # if P*I > N then go to skip
     sllv $t3, $t1, $t5         # set the (P*I)-th bit of $t3 to 1
     nor $t3, $t3, $0           # switch the bits in $t3 (1 <-> 0)
     and $s0, $s0, $t3          # S = S \{P*I} (clear the (P*I)-th bit of $s0)
     add $t4, $t4, 1            # I = I+1
     b loop1

skip:    add $t0, $t0, 1            # P = P + 1
     ble $t0, $t2, loop         # if P <= N then go to loop

     li $v0, 4
     la $a0, result             # Print "The prime numbers in [0,31] are:\n"
     syscall

# Print the set S($s0), starting from 2

     li $t0, 2
     li $t1, 4

loop2:   and $t3, $s0, $t1          # $t1 in $s0 ?
     beq $t3, $0, skip2         # if no, go to skip2
     li $v0, 1
     add $a0, $0, $t0
     syscall                    # Print $t1
     li $v0, 4
     la $a0, nl
     syscall                    # Print new line
skip2:   sll $t1, $t1, 1            # move the "1" in $t1 one bit to the left
     addi $t0, $t0, 1           # increment $t0
     ble $t0, $t2, loop2        # if $t0 <= 31 then go to loop2

     li $v0, 4
     la $a0, bye                # Print the end message
     syscall
     li $v0, 5
     syscall                    # wait for Enter
     li $v0, 10
     syscall                    # end of program

     .data
result:  .asciiz "The prime numbers in [0,31] are:\n"
bye:     .asciiz "Press enter to exit..."
nl:      .asciiz "\n"