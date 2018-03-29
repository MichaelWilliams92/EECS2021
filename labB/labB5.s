        .globl fini
        .text
main:    #-----------------
         addi $v0, $0, 5      #service #5
         syscall              #readInt 
         add  $t0, $0, $v0    #add Int
         addi $t1, $0, 7      # t1 = 7
         add  $t2, $t0, $t1   # t2 = t0+t1
         #-----------------
         addi $v0, $0, 1      #service #1
         add $a0, $0, $t2     # printInt
         syscall              #do print
         #------------------
fini:    jr      $ra         #return
