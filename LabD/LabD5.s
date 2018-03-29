          .globl Fraction
          .text
Fraction: #---------------------------------------------
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


              .globl getNumerator
              .text
getNumerator: #-----------------------------
              
              lw $v0, 0($a0) # retrieve the numerator of this
                            # fraction and return it in $v0.

             

              jr $ra


                .globl getDenominator
                .text
getDenominator: #-----------------------------


                lw $v0, 4($a0)  # retrieve the denominator of this
                                # fraction and return it in $v0.
              

                jr $ra

       .globl adding
       .text
adding:#---------------------------------------------
      sw $ra, 0($sp)
      addi $sp, $sp, -4 #push


       add $t0, $0, $a0 # $t0 = fraction 1
       add $t1, $0, $a1 # $t1 = fraction 2
 
       add $a0, $0, $t0
       jal getNumerator #get numerator
       add $t2, $0, $v0 #$t2 = numerator 1
       
       add $a0, $0, $t0
       jal getDenominator #get Denominator
       add $t3, $0, $v0 #$t3 = Denominator 1

       add $a0, $0, $t1
       jal getNumerator #get numerator
       add $t4, $0, $v0 #$t4 = numerator 2
       
       add $a0, $0, $t1
       jal getDenominator #get Denominator
       add $t5, $0, $v0 #$t5 = Denominator 2

       mult $t2, $t5 #mult num1 and den2
       mflo $a0
       add $t6, $0, $a0

       mult $t3, $t4 #mult num2 and den1
       mflo $a0
       add $t7, $0, $a0
       
       add $t2, $t6, $t7 #num1 = $t6 + $t7 
       
       mult $t3, $t5
       mflo $a0
       add $t3, $0, $a0 #den1 = $t3 * $t4

       add $a0, $0, $t2
       add $a1, $0, $t3
       jal Fraction #create new fraction

       add $s0, $0, $v0 #s0 holds the sarting address in $v0
  
       addi $sp, $sp, 4
       lw $ra, 0($sp) #pop
       jr $ra


              .globl setNumerator
              .text
setNumerator: #-----------------------------

              add $t0, $0, $a0 # t0 = numerator
              add $t1, $0, $a1 #t1 = address of factor

              sw $t0, 0($t1) #save $t0 address provided
              
              jr $ra


                .globl setDenominator
                .text
setDenominator: #-----------------------------

                add $t0, $0, $a0 # t0 = denominator
                add $t1, $0, $a1 # t1 = address of factor

                sw $t0, 4($t1) #save $t0 address provided
              
                jr $ra


                .globl multiply
                .text
multiply: #-----------------------------
          sw $ra, 0($sp)
          addi $sp, $sp, -4 #push

          add $t0, $0, $a0 # $t0 = fraction 1
          add $t1, $0, $a1 # $t1 = fraction 2

          add $a0, $0, $t0

       jal getNumerator #get numerator
       add $t2, $0, $v0 #$t2 = numerator 1
       
       add $a0, $0, $t0
       jal getDenominator #get Denominator
       add $t3, $0, $v0 #$t3 = Denominator 1

       add $a0, $0, $t1
       jal getNumerator #get numerator
       add $t4, $0, $v0 #$t4 = numerator 2
       
       add $a0, $0, $t1
       jal getDenominator #get Denominator
       add $t5, $0, $v0 #$t5 = Denominator 2

       mult $t2, $t4
       mflo $a0
       add $t6, $0, $a0 #$t6 = new numerator

       mult $t3, $t5
       mflo $a0
       add $t7, $0, $a0 #$t7 = new denominator

       add $a0, $0, $t6
       add $a1, $0, $t0
       jal setNumerator #set new numerator

       add $a0, $0, $t7
       add $a1, $0, $t0
       jal setDenominator #set new Denominator

          addi $sp, $sp, 4
          lw $ra, 0($sp) #pop
          jr $ra


                .globl subtract
                .text
subtract: #-----------------------------
          sw $ra, 0($sp)
          addi $sp, $sp, -4 #push

          add $t0, $0, $a0 # $t0 = fraction 1
          add $t1, $0, $a1 # $t1 = fraction 2

          add $a0, $0, $t1
          jal getNumerator #get numerator
          add $t4, $0, $v0 #$t4 = new numerator

          add  $t3, $0, -1
          mult $t4, $t3 #make it a negative
         
          mflo $a0 # $a0 = new numerator
          add $a1, $0, $t1
          jal setNumerator
         
          add $a0, $0, $t0
          jal adding

          addi $sp, $sp, 4
          lw $ra, 0($sp) #pop
          jr $ra

                .globl subtract
                .text
subtract: #-----------------------------
