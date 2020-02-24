.text
         li        $t0, 10          # инициализация
loop:    blez      $t0, final       # проверка условия
         move      $a0, $t0
         li        $v0, 1           # тело цикла: вывод числа
         syscall
         li        $v0, 11
         li        $a0, 0x0a        # вывод перевода строки
         syscall
         addiu     $t0, $t0, -1      # изменение
         b         loop
final:   move      $a0, $t3         # вывод суммы
         li        $v0, 10          # останов
         syscall