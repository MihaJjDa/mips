.data
        .word  0x12345
var:    .word  0x6789A
        .word  0xBCDEF

.text
        lw     $t1, 0x10010000
        lw     $t2, var
        lw     $t3, var+4