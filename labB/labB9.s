        .globl fini
        .text
main:    #---------------------------------------
         add  $v0, $0, 5          #service #5
         syscall
         add  $t0, $0, $0
         add  $t1, $0, $v0    #t1 = read int
         #---------------------------------------
         add  $t5, $0, $0
loop:    slt  $t2, $t5, $t1   #check if t5 < t1
         bne  $t2, 1, done    #jump to done if 1
         add  $t5, $t5, 1     #else, add 1 to t5
         add  $t0, $t0, $t5   #and add t5 to t0
         j loop
         #--------------------------------------
done:    add  $v0, $0, 1          #service #1
         add  $a0, $0, $t0
         syscall             #doPrint
fini:    jr      $ra         #return
