(define (even? n)
  (= (/ n 2) 0))

(define (fast-expt b n)
  (expt-iter 1 b n))

(define (expt-iter a b n))

; tests
(display "1^0 = ")
(display (fast-expt 1 0))
(newline)

(display "1^1 = ")
(display (fast-expt 1 1))
(newline)

(display "2^1 = ")
(display (fast-expt 2 1))
(newline)

(display "2^2 = ")
(display (fast-expt 2 2))
(newline)

(display "2^8 = ")
(display (fast-expt 2 8))
(newline)

(display "3^2 = ")
(display (fast-expt 3 2))
(newline)
