.data
Array:   .space    40

.text
         li        $v0, 5
         syscall

         move      $t0, $v0            # t0 - количество чисел, внешний счетчик
         move      $t3, $0             # t3 - количество сохранненных чисел
         la        $t6, Array          # t6 - текущий адрес записи
st:      beqz      $t0, fin
         li        $v0, 5
         syscall
         
         la        $t2, Array          # t2 - адрес начала провеки
         move      $t4, $t3            # t4 - количество проверяемых чисел 
st1:     beqz      $t4, fin1           
         lw        $t5, ($t2)          # t5 - проверяемое число
         bne       $t5, $v0, next1      
         j badnext
next1:   addiu     $t2, $t2, 4             
         subiu     $t4, $t4, 1
         j         st1
fin1:    sw        $v0, ($t6)
         addiu     $t6, $t6, 4
         addiu     $t3, $t3, 1

badnext: subiu     $t0, $t0, 1
         j         st
         
         
fin:     la        $t2, Array
	 move      $t0, $t3
finst:   beqz      $t3, ex
         lw        $a0, ($t2)         
         li        $v0, 1
         syscall
         li        $v0, 11
         li        $a0, 0x0a        
         syscall
         subiu     $t3, $t3, 1
         addiu     $t2, $t2, 4
         j         finst
     
ex:      li        $v0, 10
         syscall
