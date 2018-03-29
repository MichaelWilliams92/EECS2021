       .globl fini
        .text
main:    #----------------- 
         addi   $v0, $0, 5
         syscall
         add    $t0, $0, $v0
         #------------------------
         sll   $a0, $t0, 21
         srl   $a0, $a0, 31
         #--------------------
         addi $v0, $0, 1
         syscall
fini:    jr      $ra         #return
