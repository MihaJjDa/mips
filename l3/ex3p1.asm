.data
X:       .word     0

.text
         li        $v0, 5
         syscall
         move      $t0, $v0
         bgez      $t0, next
         sub       $t0, $0, $t0
next:    move      $a0, $0
st:      beqz      $t0, fin
         li        $t1, 10
         divu      $t0, $t1
         mfhi      $t2
         addu      $a0, $a0, $t2
         mflo      $t0
         j         st
fin:     li        $v0, 1
         syscall
         li        $v0, 10
         syscall
