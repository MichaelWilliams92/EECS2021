      .text
main: sw $ra, 0($sp)
      addi $sp, $sp, -4 #push

      addi $a0, $0, 3
      addi $a1, $0, 8
      jal Fraction

      add $s0, $0, $v0 # s0 holds the sarting address in $v0
     
      addi $a0, $0, 1
      addi $a1, $0, 2
      jal Fraction

      add $s1, $0, $v0 # s1 holds the sarting address in $v0
     
      addi $sp, $sp, 4
      lw $ra, 0($sp) #pop
      jr $ra