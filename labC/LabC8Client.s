main: sw $ra, 0($sp) #saves $ra at the location pointed at by $sp
      addi $sp, $sp, -4 #decrements $sp so that any further storage to it would not overwrite $ra
      
      .text
      lw $a0, MAX($0) #loadwork of max.  Register$0 acts as an index
      addi  $v0, $0, 1
      syscall     

      #lb $a0, SIZE($0) #loadbyte of SIZE.  Register $0 acts as an index
      addi $t0, $0, 4 #alternative to above statement
      lbu $a0, MAX($t0)#2nd line of alt
      addi $v0, $0, 1
      syscall

      #getCount/setCount

      jal getCount #jump and link getCount
      add $a0, $0, $v0
      addi $v0, $0, 1
      syscall

      add $v0, $0, 5
      syscall

      add $a0, $0, $v0
      jal setCount #jal setCount

      jal getCount #jump and link getCount
      add $a0, $0, $v0
      addi $v0, $0, 1
      syscall
      
      #Signum

      add $v0, $0, 5
      syscall
      add $a0, $0, $v0
     
      jal signum #signum
      add $a0, $0, $v0 
      addi $v0, $0, 1
      syscall #print signum

      jal getCount #jump and link getCount
      add $a0, $0, $v0
      addi $v0, $0, 1
      syscall #print getCount

      #getPrime

      add $v0, $0, 5
      syscall
      add $a0, $0, $v0

      jal isPrime #jal isPrime
      add $a0, $0, $v0
      addi $v0, $0, 1
      syscall   #print isPrime. result = 1 is true, result = 0 if false 
      
      #printVertical

      add $v0, $0, 5
      syscall
      add $a0, $0, $v0

      #jal printVertical
      #add $a0, $0, $v0
      #addi $v0, $0, 1
      #syscall #print printVertical

      addi $sp, $sp, 4
      lw $ra, 0($sp)

      jr $ra

#find out how to println

      
