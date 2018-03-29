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


