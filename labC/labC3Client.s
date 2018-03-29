           .text
#           .data
#space:     .asciiz "\n"
main:      lw         $4, 0x10010000($0)
           addi       $v0, $0, 1
           syscall
#------------------------------------------
           addi       $v0, $0, 11
           addi       $a0, $0, ' '
           syscall
 #          addi       $v0, $0, 4   #system #4, print string
 #         la         $a0, space   #load address of the string
 #        syscall
#----------------------------------------------
          # lb         $a0, SIZE($0)
           addi        $t0, $0, 4
           lb          $a0, MAX($t0) #we can use this arithmetic technique to
           addi        $v0, $0, 1    #access private values as well
           syscall
#-----------------------------------------
           jr         $ra

