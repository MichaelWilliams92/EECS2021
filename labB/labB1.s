         .text
main:    #-----------------
         li   $t0, 60         # t0 = 60
         addiu $t1, $0, -324     # t1 = 7
         add  $t2, $t0, $t1   # t2 = t0+t1
         #-----------------
         addi $v0, $0, 1      #service #1
         add $a0, $0, $t2     # printInt
         syscall              #do print
         #------------------
         jr      $ra         #return
