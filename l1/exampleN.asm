.data 0x10020000
inum:    .word 4  # Количество
a:       .word 12 # Входные данные
b:       .word 13
c:       .word 14
d:       .word 15

.data 0x10030000
onum:    .word 2 # количество
x:       .word 0 # выходные данные
y:       .word 0

# Пример: сложить попарно четыре числа
.text
         lw        $t1, a
         lw        $t0, b
         add       $t1, $t0, $t1
         sw        $t1, x
         lw        $t1, c
         lw        $t0, d
         add       $t1, $t0, $t1
         sw        $t1, y
         li        $v0, 1
         lw        $a0, d
         syscall   
         li        $v0, 11
         li        $a0, 0xa
         syscall
         
         