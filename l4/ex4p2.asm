.data
Arr:    .space     40

.text
         li        $v0, 5
         syscall
         move      $s0, $v0
         move      $s7, $v0

         move      $s1, $0
st1:     beq       $s0, $0, fin1
         addiu     $s0, $s0, -1
         li        $v0, 5
         syscall
         move      $a0, $v0
         jal       LeftDig
         sw        $v0, Arr($s1)
         addiu     $s1, $s1, 4
         j         st1
fin1:    move      $s1, $0
st:      beq       $s7, $0, fin
         addiu     $s7, $s7, -1
         lw        $a0, Arr($s1)      
         li        $v0, 1
         syscall
         addiu     $s1, $s1, 4
         j         st
fin:     li        $v0, 10
         syscall
        
LeftDig: addiu     $sp, $sp, -4
         sw        $ra, ($sp)
         slt       $t0, $a0, $0
         beq       $t0, $0, next
         subu      $a0, $0, $a0
next:    slti      $t0, $a0, 10
         bne       $t0, $0, ex
         li        $t0, 10
         divu      $a0, $t0
         mflo      $a0
         jal       LeftDig
         move      $a0, $v0
ex:      move      $v0, $a0
         lw        $ra, ($sp)
         addiu     $sp, $sp, 4
         jr        $ra    
