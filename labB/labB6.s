        .globl fini
        .text
main:    #-----------------
         addi $v0, $0, 5      #service #5
         syscall              #readInt 
         add  $t0, $0, $v0    #add Int
         addi $t1, $0, 7      # t1 = 7
         beq $t0, $t1, XX
         sub $t2, $t0, $t1    #t2 = t0-t1
         j YY
XX:      add  $t2, $t0, $t1   # t2 = t0+t1
         #-----------------
YY:      addi $v0, $0, 1      #service #1
         add $a0, $0, $t2     # printInt
         syscall              #do print
         #------------------
fini:    jr      $ra         #return
