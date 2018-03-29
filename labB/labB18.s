        .globl fini
        .text
main:    #---- -------------------
         addi   $v0, $0, 5
         syscall
         add    $t0, $0, $v0
         #------------------------
        # add   $t5, $0, 0xffff
        # sll   $t5, $t5, 16
        # ori    $t5, $t5, 0xfbff  #will create mask of all 1s and 0 in bit #10
        # and   $a0, $t0, $t5
         #------------------------
         sll    $t1, $t0, 21
         srl    $t1, $t1, 31     #t1 = bit#10
         #--------------------------------------
         beq    $t1, $0,  XX    # if t1 = 0, go to XX
         lui $t7, 0xffff
         ori $t7, $t7, 0xfbff  #will create mask with all 1s and a zero
         and $a0, $t0, $t7  #replace bit #10 with a 0
         j YY
XX:      addi $t7, $0, 1024    #will create mask with all zeros and a 1
         xor  $a0, $t7, $t0    #replace bit 10 with a 1
        #------------------------------------------
YY:      addi $v0, $0, 1 
         syscall
fini:    jr      $ra         #return
