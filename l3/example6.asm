.text
         li        $t0, 10
         move      $t1, $t0
loop:    beqz      $t1, final
         addiu     $t1, $t1, -1
         b         loop
final:   li        $v0, 10
         syscall
