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


