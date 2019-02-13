(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (define (find-a n r)
    (if (= (remainder n 2) 0)
        (find-a (/ n 2) (+ 1 r))
        r))
  (find-a z 0))

(define (cdr z)
  (define (find-b n r)
    (if (= (remainder n 3) 0)
        (find-b (/ n 3) (+ 1 r))
        r))
  (find-b z 0))


;; validation test
(= (car (cons 1 2)) 1) ;=> #t

(= (cdr (cons 1 2)) 2) ;=> #t
