        .globl fini
        .text
main:    #---- -------------------
         addi   $v0, $0, 5
         syscall
         add    $t0, $0, $v0
         #------------------------
         add   $t5, $0, 0xffff
         sll   $t5, $t5, 16
         ori    $t5, $t5, 0xfbff  #will create mask of all 1s and 0 in bit #10
         and   $a0, $t0, $t5
         #--------------------
         addi $v0, $0, 1
         syscall
         addi $v0, $0, 11
         add  $a0, $0, ' '
         syscall
         #------------------------
         lui $t7, 0xffff
         ori $t7, $t7, 0xfbff  #will create same t5 mask easier
         and $a0, $t7, $t0
         addi $v0, $0, 1
         syscall
fini:    jr      $ra         #return
