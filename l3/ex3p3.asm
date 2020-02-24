.data
Array:   .space    40

.text
         li        $v0, 5
         syscall
         move      $t9, $v0

         move      $t0, $t9
         la        $t2, Array
         move      $t3, $0
st:      beqz      $t0, fin
         li        $v0, 5
         syscall
         andi      $t1, $v0, 1
         bnez      $t1, next
         sw        $v0, ($t2)
         addiu     $t2, $t2, 4
         addiu     $t3, $t3, 1
next:    subi      $t0, $t0, 1
         j         st
         
         
fin:     beqz      $t3, ex
         subiu     $t2, $t2, 4
         lw        $a0, ($t2)         
         li        $v0, 1
         syscall
         li        $v0, 11
         li        $a0, 0x0a        
         syscall
         subi      $t3, $t3, 1
         j         fin
     
ex:      li        $v0, 10
         syscall
