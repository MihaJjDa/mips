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
         sw        $v0, Arr($s1)
         addiu     $s1, $s1, 4
         j         st1
fin1:    
         la        $a0, Arr
         move      $a1, $s7
         jal bubble 
         
         move      $s1, $0
st:      beq       $s7, $0, fin
         addiu     $s7, $s7, -1
         lw        $a0, Arr($s1)      
         li        $v0, 1
         syscall
         li        $a0, ' '
         li        $v0, 11
         syscall
         addiu     $s1, $s1, 4
         j         st
fin:     
         li        $v0, 10
         syscall
        


bubble:  addiu     $sp, $sp, -4
         sw        $ra, ($sp)
         
         addiu     $t0, $a1, -1
for1:    beq       $t0, $0, ex
         
         move      $t1, $t0
         move      $t2, $a0
for2:    beq       $t1, $0, next
         lw        $t3, ($t2)
         lw        $t4, 4($t2)
         slt       $t5, $t4, $t3
         beq       $t5, $0, succ
         sw        $t3, 4($t2)
         sw        $t4, ($t2)
succ:    addiu     $t2, $t2, 4
         addiu     $t1, $t1, -1
         j         for2
 
next:    addiu     $t0, $t0, -1
         j         for1
         
ex:      
         lw        $ra, ($sp)
         addiu     $sp, $sp, 4
         jr        $ra    
