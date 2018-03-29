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
