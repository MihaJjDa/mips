# какие-то значения
         li        $a0, 5
         li        $a1, 6
         li        $a2, 7
# вызов подпрограммы    
         jal       treug
# Выход из основной программы
         li        $v0, 10
         syscall
        
# Подпрограмма    
treug:   move      $v0, $zero
         add       $t0, $a0, $a1
         add       $t1, $a1, $a2
         add       $t2, $a0, $a2
         bgt       $a2, $t0, not
         bgt       $a0, $t1, not
         bgt       $a1, $t2, not
         li        $v0, 1
not:     jr        $ra    