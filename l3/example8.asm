.text
         li        $t0, 6
         li        $t1, 7
         li        $t2, 5
         mult      $t0, $t1
         mflo      $t3
         div       $t3, $t2
         mflo      $t6                 