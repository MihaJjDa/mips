.data
X:       .word     0

.text
         li        $v0, 5
         syscall
         move      $t0, $v0
         move      $a0, $0
         move      $t1, $0
st:      beqz      $t0, fin
         li        $v0, 5
         syscall
         beqz      $t1, sum
         sub       $a0, $a0, $v0
         j         next
sum:     add       $a0, $a0, $v0         
next:    subi      $t0, $t0, 1
         slti      $t1, $t1, 1
         j         st
fin:     li        $v0, 1
         syscall
         li        $v0, 10
         syscall
