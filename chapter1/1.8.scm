( define ( improve guess x )
         ( / ( + ( / x
                     ( square guess ) )
                 ( * 2 guess ) )
             3 ) )

( define ( good-enough? guess x )
         ( < ( / ( abs ( - ( improve guess x )
                           guess ) )
                 guess )
             0.001 ) )

( define ( cubert-iter guess x )
         ( if ( good-enough? guess x )
              guess
              ( cubert-iter ( improve guess x )
                            x ) ) )

; expected: 2
( cubert-iter 1.0 8 )
; expected: 3
( cubert-iter 1.0 27 )
