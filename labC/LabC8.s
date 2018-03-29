            .globl MAX
           .globl SIZE
           #-----------------------------
           .data
MAX:       .word 2147483647;
SIZE:      .byte 32;
count:     .word 0;
           .text

          .globl getCount
          #-----------------------------
          .text
getCount: #-----------------------------
          lw $v0, count($0)
          jr $ra

          .globl setCount
          #-----------------------------
          .text
setCount: #-----------------------------
          sw $a0, count($0)
          jr $ra

          .globl signum
          #-----------------------------
          .text
signum:   #-----------------------------
          sw $ra, 0($sp) #saves $ra at the location pointed at by $sp
          addi $sp, $sp, -4 #decrements $sp so that any further storage to it would not overwrite $ra

          add $t0, $0, $a0 #int i 
          slt $t6, $t0, $0 # if $t0 < 0, $t6 = 1, else $t6 = 0
          beq $t6, 1, XX # if $t6 = 1, j to XX
          beq $t0, $0, ZZ
          add $t1, $0, 1 #result = 1
          j YY
XX:       add $t1, $0, -1 #result = -1   #$t1 = result
          j YY
ZZ:       add $t1, $0, 0 #result = 0
  
YY:       jal getCount
          add $a0, $v0, 1 #getCount and increase value by 1
          jal setCount #setCount to count++
        
          add $v0, $0, $t1
         # lw $v0, $v0 #return $t1, whydosent this work?

          addi $sp, $sp, 4
          lw $ra, 0($sp)
          jr $ra

          .globl isPrime
          #-----------------------------
          .text
isPrime:  #-----------------------------
          sw $ra, 0($sp) #saves $ra at the location pointed at by $sp
          addi $sp, $sp, -4 #decrements $sp so that any further storage to it would not overwrite $ra

          add $s0, $0, $a0 #$s0 will be int i
          addi $s1, $0, 1 #$s1 will be result 
          addi $s2, $0, 2 #s2 will be candidate

loop:     slt $t0, $s2, $s0 # if candidate < i $t0 = 1, else $t0 = 0
          bne $t0, 1, AA #if $t0 != 1, jump to AA 
          bne $s1, 1, AA #if result != true, jump to AA   
                
          jal isFactor #jal isFactor, isFactor does what it needs to do
          add $a0, $0, $v0 #$a0 = result that has been returned

          beq $a0, 1, BB #if return == 1, jump to BB
          add $s1, $0, 1
          j CC

BB:       addi $s1, $0, 0 

CC:       add $s2, $s2, 1 #candidate++
          j loop

AA:       add $v0, $0, $s1
          ##lw $v0, $t0 #return result

          addi $sp, $sp, 4
          lw $ra, 0($sp)
          jr $ra          

          .globl isFactor
          #-----------------------------
          .text
isFactor: #-----------------------------
          add $t5, $0, $s0 #int n
          add $t6, $0, $s2 #int factor
                           #$a0 will be the result

          div $t5, $t6 #$t5 / $t6
          mfhi $t7 #get % answer
          beq $t7, 0, EE # if $t7 == 0, jump to EE
          add $a0, $0, $0 # $a0 == false
          j FF
EE:       add $a0, $0, 1 # $a0 = true
FF:       add $v0, $0, $a0
          #lw $v0, $t5 #return $a0

          jr $ra

          .globl printVertical
          #-----------------------------
          .text
printVertical: #-----------------------------

          sw $ra, 0($sp) #saves $ra at the location pointed at by $sp
          addi $sp, $sp, -4 #decrements $sp so that any further storage to it would not overwrite $ra

          add $t0, $0, $a0 #int n
          slt $t5, $t0, 0
          beq $t5, 1, GG #if n < 0 jump to GG
          beq $t0, 0, GG #if $t0 = 0, jump to GG          

          addi $t1, $0, 10
          div $t0, $t1 # int n / 10

          mflo $a0 #n / 10 = $a0
          jal printVertical #jal printVertical for $a0
  
          mfhi $a0 #n % 10 = $a0
          addi $v0, $0, 1 #printNum
          syscall 
        
          #learn to print on new line
          addi $sp, $sp, 4
          lw $ra, 0($sp)
GG:       jr $ra



