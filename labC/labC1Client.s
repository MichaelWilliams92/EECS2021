           .text
#           .data
#space:     .asciiz "\n"
main:      lw         $a0, MAX($0)
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
           lbu        $a0, SIZE($0)
           addi       $v0, $0, 1
           syscall
#-----------------------------------------
           jr         $ra

