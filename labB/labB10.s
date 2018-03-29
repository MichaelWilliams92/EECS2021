         .globl fini
         .text
main:    #--------------------
         addi    $t0, $0, 60
         addi     $t1, $0, 7
         div      $t0, $t1
         mflo     $a0
         #--------------------
         addi     $v0, $0, 1  #system#1
         syscall              #print quotient
         addi     $v0, $0, 11  
         add      $a0, $0, ' '
         syscall
         #-------------------------
         mfhi     $a0
         addi     $v0, $0, 1
         syscall
         addi     $v0, $0, 11  
         add      $a0, $0, ' '
         syscall              #print remainder
         #---------------------
         mult     $t0, $t1
         mflo     $a0         #print least 32 bits
         addi     $v0, $0, 1
         syscall
         addi     $v0, $0, 11
         add      $a0, $0, ' '
         syscall
         #---------------------------------------
         mfhi     $a0         #print most 32 bits
         addi     $v0, $0, 1
         syscall
         addi     $v0, $0, 11 
         add      $a0, $0, ' '
         syscall
fini:    jr      $ra         #return
         
