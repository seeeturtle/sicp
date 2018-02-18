( define ( A x y )
         ( cond ( ( = y 0 ) 0 )
                ( ( = x 0 ) ( * 2 y ) )
                ( ( = y 1 ) 2 )
                ( else ( A ( - x 1 )
                           ( A x ( - y 1 ) ) ) ) ) )

; result: 1024
( A 1 10 )
; result: 65536
( A 2 4 )
; result: 65536
( A 3 3 )

; ( f n ) computes 2 * n
; ( g n ) computes 2 ^ n
; ( h n ) computes 2 ^ (2n - 2)