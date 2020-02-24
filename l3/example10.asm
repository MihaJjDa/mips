.data
Array:   .space    40              # 40 байтов памяти
NoNeed:  .word     0xdeadbeef      # просто, чтобы было видно конец)

.text
         li        $t0,      10          # инициализация
         la        $t1,      Array       # la — то же самое, что и li, просто для удобства понимания
loop:    blez      $t0,      final       # проверка условия
         sw        $t0,      ($t1)       # записываем слово в память
         addiu     $t1, $t1, 4       # Увеличиваем адрес на 4
         addiu     $t0, $t0, -1      # изменение
         b                   loop
final:   li        $v0,      10          # останов
         syscall