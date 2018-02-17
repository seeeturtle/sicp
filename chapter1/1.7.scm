( define ( average x y )
         ( / ( + x y ) 2 ) )

( define ( improve guess x )
         ( average guess ( / x guess ) ) )

( define ( good-enough? guess x )
         ( < ( abs ( - ( square guess ) x ) ) 0.001 ) )

( define ( new-good-enough? guess x )
         ( < ( / ( abs ( - ( improve guess x )
                           guess ) )
                 guess )
             0.001 ) )

( define ( sqrt-iter guess x )
         ( if ( good-enough? guess x )
              guess
              ( sqrt-iter ( improve guess x )
                          x ) ) )

( define ( new-sqrt-iter guess x )
         ( if ( new-good-enough? guess x )
              guess
              ( new-sqrt-iter ( improve guess x )
                              x ) ) )

; bad case
; expected: near to 0.0001
( sqrt-iter 1.0 0.00000001 )
; expected: near to 10000000000
( sqrt-iter 1.0 10000000000000000000000 )

; good case
; expected: near to 0.0001
( new-sqrt-iter 1.0 0.00000001 )
; expected: near to 10000000000
( new-sqrt-iter 1.0 10000000000000000000000 )

; note:
; I can't find what "large" nubmer fails with original sqrt-iter procedure.
; Some people says that large number can lead to endless loop.
; However, even my number is large enough, original sqrt-iter returns better
; result than new-sqrt-iter.
