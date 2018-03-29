      .text
main: sw $ra, 0($sp)
      addi $sp, $sp, -4 #push

      #creating fractions

      addi $a0, $0, 3
      addi $a1, $0, 8
      jal Fraction

      add $s0, $0, $v0 # s0 holds the sarting address in $v0
     
      addi $a0, $0, 1
      addi $a1, $0, 2
      jal Fraction

      add $s1, $0, $v0 # s1 holds the sarting address in $v0

      #printing out $s0

      add $a0, $0, $s0
      jal getNumerator #get numerator

      add $a0, $0, $v0
      addi $v0, $0, 1 #system call 1
      syscall #print Int(numerator)

      addi $a0, $0, '/'
      addi $v0, $0, 11 #system call 11
      syscall #print Char

      add $a0, $0, $s0
      jal getDenominator #get denominator

      add $a0, $0, $v0
      addi $v0, $0, 1 #system call 1
      syscall #print Int(denominator)

      addi $a0, $0, 10
      addi $v0, $0, 11 #system 11
      syscall #println

      #printing out $s1

      add $a0, $0, $s1
      jal getNumerator #get numerator

      add $a0, $0, $v0
      addi $v0, $0, 1 #system call 1
      syscall #print Int(numerator)

      addi $a0, $0, '/'
      addi $v0, $0, 11 #system call 11
      syscall #print Char

      add $a0, $0, $s1
      jal getDenominator #get denominator

      add $a0, $0, $v0
      addi $v0, $0, 1 #system call 1
      syscall #print Int(denominator)

      addi $a0, $0, 10
      addi $v0, $0, 11 #system 11
      syscall #println

      #addFactors

      add $a0, $0, $s0
      add $a1, $0, $s1
      jal adding

      #print adding
      
      add $a0, $0, $s0
      jal getNumerator #get numerator

      add $a0, $0, $v0
      addi $v0, $0, 1 #system call 1
      syscall #print Int(numerator)

      addi $a0, $0, '/'
      addi $v0, $0, 11 #system call 11
      syscall #print Char

      add $a0, $0, $s0
      jal getDenominator #get denominator

      add $a0, $0, $v0
      addi $v0, $0, 1 #system call 1
      syscall #print Int(denominator)

      addi $a0, $0, 10
      addi $v0, $0, 11 #system 11
      syscall #println

      #set num/den

      addi $a0, $0, 5
      add $a1, $0, $s0 
      jal setNumerator

      addi $a0, $0, 9
      add $a1, $0, $s0 
      jal setDenominator

      #print new factor

       add $a0, $0, $s0
      jal getNumerator #get numerator

      add $a0, $0, $v0
      addi $v0, $0, 1 #system call 1
      syscall #print Int(numerator)

      addi $a0, $0, '/'
      addi $v0, $0, 11 #system call 11
      syscall #print Char

      add $a0, $0, $s0
      jal getDenominator #get denominator

      add $a0, $0, $v0
      addi $v0, $0, 1 #system call 1
      syscall #print Int(denominator)

      addi $a0, $0, 10
      addi $v0, $0, 11 #system 11
      syscall #println


      addi $sp, $sp, 4
      lw $ra, 0($sp) #pop
      jr $ra