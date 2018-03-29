           .text
main:      sw         $ra  0($sp)
          addi       $sp, $sp, -4

           lw         $a0, MAX($0)
           addi       $v0, $0, 1
           syscall
#------------------------------------------
           jal println
#----------------------------------------------
           lbu        $a0, SIZE($0)
           addi       $v0, $0, 1
           syscall
#-----------------------------------------
           jal println
#--------------------------------------------------
           jal        getCount
           add        $a0, $0, $v0
           addi       $v0, $0, 1
           syscall
           jal println
#-----------------------------------------------
           sw         $ra  0($sp)
           addi       $sp, $sp, -4

           add        $v0, $0, 5
           syscall
           add        $a0, $0, $v0 
           jal        Count     #changes value of count to $a0  
           
           addi       $sp, $sp, 4
           lw         $ra  0($sp)
           
           sw         $ra  0($sp)
           addi       $sp, $sp, -4

           jal        getCount
           add        $a0, $0, $v0
           addi       $v0, $0, 1  
           syscall         

           addi       $sp, $sp, 4
           lw         $ra  0($sp)
           jal println
#----------------------------------------------
           add        $v0, $0, 5
           syscall
           add        $a0, $0, $v0    #read value

           sw         $ra  0($sp)
           addi       $sp, $sp, -4
           
           jal signum 
           add        $v0, $0, 1    #$a0 should already b the value returned
           syscall
           jal println

           addi       $sp, $sp, 4
           lw         $ra  0($sp)


           sw         $ra  0($sp)
           addi       $sp, $sp, -4

           jal        getCount
           add        $a0, $0, $v0     #get new Count
           addi       $v0, $0, 1  
           syscall         

           addi       $sp, $sp, 4
           lw         $ra  0($sp)
           jal println
#-------------------------------------------------
           addi       $sp, $sp, 4
           lw         $ra  0($sp)
           jr         $ra
#-------------------------------------------------
          

