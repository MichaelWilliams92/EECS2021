        .globl fini
        .text
main:    #-----------------
         addi $v0, $0, 5      #service #5
         syscall              #readInt 
         add  $t0, $0, $v0    #add Int
         addi $t1, $0, 7      # t1 = 7
         slt $t3, $t0, $t1    #t3 compares t0 and t1
         bne $t3, 1, XX
         add $t2, $t0, $t1    #t2 = t0+t1
         j YY
XX:      sub  $t2, $t0, $t1   # t2 = t0-t1
         #-----------------
YY:      addi $v0, $0, 1      #service #1
         add $a0, $0, $t2     # printInt
         syscall              #do print
         #------------------
fini:    jr      $ra         #return
