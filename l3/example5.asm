.text
         li        $t0, 20
start:   li        $t1, 5
         move      $t2, $t0
loop:    beqz      $t2, fin
         subu      $t2, $t2, $t1
         b         loop
fin:     sra       $t0, $t0, 1
         bnez      $t0, end
         j         start
end:     nop
         li        $v0, 10
         syscall