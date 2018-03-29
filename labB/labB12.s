        .globl fini
        .text
main:    #-----------------
         addi   $v0, $0, 5
         syscall
         add    $t0, $0, $v0
         #------------------------
         sll   $t1, $t0, 4
         sll   $t2, $t0, 1
         add   $a0, $t1, $t2
         #--------------------
         addi $v0, $0, 1
         syscall
fini:    jr      $ra         #return
