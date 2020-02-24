.data
n:       .word     7
res:     .word     0

.text
         lw        $a0, n
         jal       fact
         sw        $v0, res

fact:    addiu     $sp, $sp, -4      # спасём $ra
         sw        $ra, ($sp)
         addiu     $sp, $sp, -4      # спасём $s0
         sw        $s0, ($sp)

         move      $s0, $a0          # Сформируем n-1
         subi      $a0, $a0, 1
         ble       $a0, 1, done      # Если n<2, готово
 
         jal       fact              # Посчитаем fact(n-1)
         mul       $s0, $s0, $v0     # $s0 пережил вызов

done:    move      $v0, $s0          # возвращаемое значение
         lw        $s0, ($sp)        # вспомним $s0
         addiu     $sp, $sp, 4
         lw        $ra, ($sp)        # вспомним $ra
         addiu     $sp, $sp, 4
         jr        $ra