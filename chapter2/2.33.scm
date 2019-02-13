(define (acc f init seq)
  (if (null? seq)
      init
      (f (car seq) (acc f init (cdr seq)))))

(define (map f seq)
  (acc (lambda (x y) (cons (f x) y)) () seq))

(define (append seq1 seq2)
  (acc cons seq2 seq1))

(append (list 1 2 3) (list 4 5 6))

(define (length seq)
  (acc (lambda (x y) (+ y 1)) 0 seq))

(length (list 1 2 3))
