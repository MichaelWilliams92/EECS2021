        .globl fini
        .text
main:    #-----------------------
         addi   $v0, $0, 5
         syscall
         add    $t0, $0, $v0
         #------------------------
         andi    $a0, $t0, 1024
         #------------------------
         addi $v0, $0, 1
         syscall
fini:    jr      $ra         #return
