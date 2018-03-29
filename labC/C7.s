         .globl      MAX
         .globl      SIZE
         #-----------------------------
         .text
         #-------------------------------
         .data
MAX:     .word        2147483647;
SIZE:    .byte        32;
count:   .word        0;
          jr            $ra

           .globl  getCount
#-----------------------------------
           .text
#------------------------------------
getCount:  lw           $v0, count($0)
           jr           $ra
#--------------------------------------

           .globl    Count
           .text
#---------------------------------------------
Count:     add          $t0, $0, $a0  #t0 = new count
           lw           $v0, count($0)
           sw           $t0, count($0)
           jr           $ra
#--------------------------------------

           .globl  println
           .text
#-----------------------------------------
 println:  addi       $v0, $0, 11
           addi       $a0, $0, 10
           syscall
           jr         $ra


           .globl   signum
           .text
#-----------------------------------------------
signum:    add        $t0, $0, $a0   #t0 = value sent
           slt        $t1, $t0, $0   #t1 = 1 if if value is <0 
           addi       $t3, $0, 1
           beq        $t1, 1,  lessThan
           beq        $t0, 0,  isZero  
           add $a0, $0, 1
           j Next
lessThan:  add $a0, $0, -1            
           j Next
isZero:    add $a0, $0, 0
           j Next

Next:      lw           $v0, count($0)
           add          $a1, $v0, 1  #a1 = count ++
           sw           $a1, count($0)
           jr           $ra
#--------------------------------------------------

          .globl isFactor
          .text
#----------------------------------------------------
isFactor:   add $t0, $0, $a0  #t0 = int n
            add $t1, $0, $a1  #t1 = int factor
 
            div  $t0, $t1
            mfhi $a0               #$a0 = mod answer
            beq  $a0, 0 factorable
            addi $t3, $0, 0        #value is not factorable
            j YY
factorable: add  $t3, $0, 1        # value is factorable
YY:         add  $a0, $0, $t3      #a0 = result now
            jr   $ra
#----------------------------------------------------------

            .globl isPrime
            .text
#------------------------------------------------------------
isPrime:    addi $t5, $0, 1      #t5 = boolean = true
            add $t0, $0, 2       #t0 = int candidate
            add $t4, $0, $a0    #t4 = int i
            
LOOP:       beq $t5, 1, XX       #if boolean is still true  
            j end
XX:         slt $t1, $t0, $t4    #if candidate is < int i
            beq $t1, 1, HH
            j end

HH:        add $a0, $0, $t4   #$a0 = int i
           add $a1, $0, $t0   #$a1 = int factor

           sw         $ra  0($sp)
           addi       $sp, $sp, -4

           jal isFactor

           addi       $sp, $sp, 4
           lw         $ra  0($sp)

           beq $a0, $0, AA
           addi $t5, $0, 0     #if result = 1, boolean = 0
           j GG
AA:        addi $t5, $0, 1     #if result = 0, boolean = 1 

           j LOOP

end:       add $a0, $0, $t5
           jr          $ra

   

           





