# какие-то значения
         li        $t1, 5
         li        $t2, 6
         li        $t3, 7
# вызов подпрограммы    
         jal       treug
# Выход из основной программы
         li        $v0, 10
         syscall
        
# Подпрограмма    
treug:   move      $t0, $zero
         add       $t4, $t1, $t2
         add       $t5, $t2, $t3
         add       $t6, $t3, $t1
         bgt       $t3, $t4, not
         bgt       $t1, $t5, not
         bgt       $t2, $t6, not
         li        $t0, 1
not:     jr        $ra    