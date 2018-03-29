          .globl Fraction
          .text
Fraction:
          #---------------------------------------------
          add $t0, $0, $a0 # t0 = numerator
          add $t1, $0, $a1 # t1 = denominator

          # store the attributes somewhere in memory
          # and return a reference to where they are

          addi $v0, $0, 9 #system 9, will allocate space indicated by $a0 and return the starting address to $v0
          addi $a0, $0, 8 #$a0 = # of bytes
          syscall

          sw $t0, 0($v0) #save $t0 
          sw $t1, 4($v0) #save $t1

          jr $ra