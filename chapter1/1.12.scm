( define ( pascal-triangle r c )
         ( if ( or ( = c 1 ) ( = c r ) )
              1
              ( + ( pascal-triangle ( - r 1 ) c )
                  ( pascal-triangle ( - r 1 ) ( - c 1 ) ) ) ) )

( pascal-triangle 1 1 )
( pascal-triangle 2 1 )
( pascal-triangle 2 2 )
( pascal-triangle 3 1 )
( pascal-triangle 3 2 )
( pascal-triangle 3 3 )
