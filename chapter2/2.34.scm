(define (acc f init seq)
  (if (null? seq)
      init
      (f (car seq) (acc f init (cdr seq)))))

(define (horner-eval x coefficients)
  (acc (lambda (curr acc) (+ (* acc x) curr)) 0 coefficients))

(horner-eval 2 (list -1 0 1))
