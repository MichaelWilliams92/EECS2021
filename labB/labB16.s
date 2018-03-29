    .globl fini
        .text
main:    #-----------------
         addi   $v0, $0, 5
         syscall
         add    $t0, $0, $v0
         #------------------------
         addi $t6, $0, 1024
         nor  $t4, $0, $t6  #will create ~1024
         and  $a0, $t4, $t0
         #--------------------
         addi $v0, $0, 1
         syscall
fini:    jr      $ra         #return
