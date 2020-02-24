.code
         li        $v0, 5
         syscall
         move      $a0, $v0
         li        $v0, 5
         syscall
         move      $a1, $v0
         jal       rGCD
         move      $a0, $v0
         li        $v0, 1
         syscall
         li        $v0, 10
         syscall
        
rGCD:    addiu     $sp, $sp, -4
         sw        $ra, ($sp)
         beq       $a0, $a1, ex
         slt       $t0, $a0, $a1
         beq       $t0, $0, next
         move      $t0, $a0
         move      $a0, $a1
         move      $a1, $t0
next:    sub       $a0, $a0, $a1
         jal       rGCD    
ex:      move      $v0, $a0
         lw        $ra, ($sp)
         addiu     $sp, $sp, 4
         jr        $ra    
