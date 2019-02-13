;; 이것도 racket입니다

(define (queens board-size)
  (define (adjoin-position new-row k rest-of-queens)
    (cons (list new-row k) rest-of-queens))
  (define (len a b) (abs (- a b)))
  (define (safe? k positions)
    (let ([r1 (caar positions)]
          [c1 (cadar positions)]
          [rest (cdr positions)])
      (let ([check (lambda (p)
                     (let ([r2 (car p)]
                           [c2 (cadr p)])
                       (and (not (= r1 r2))
                            (not (= (len r1 r2) (len c1 c2))))))])
        (foldl (lambda (a b) (and a b)) #t (map check rest)))))
  (define (queen-cols k)
    (if (= k 0)
        (map (lambda (x) '()) (range board-size))
        (filter
         (lambda (positions) (safe? k positions))
         (foldl append '()
                (map (lambda (rest-of-queens)
                       (map (lambda (new-row)
                              (adjoin-position new-row k rest-of-queens))
                            (range 1 (+ board-size 1))))
                     (queen-cols (- k 1)))))))
  (queen-cols board-size))

;; safe? 테스트
(define (len a b) (abs (- a b)))
(define (safe? k positions)
  (let ([r1 (caar positions)]
        [c1 (cadar positions)]
        [rest (cdr positions)])
    (let ([check (lambda (p)
                   (let ([r2 (car p)]
                         [c2 (cadr p)])
                     (and (not (= r1 r2))
                          (not (= (len r1 r2) (len c1 c2))))))])
      (foldl (lambda (a b) (and a b)) #t (map check rest)))))

(safe? 2 '((3 1) (7 2) (2 3))) ;= #t

(queens 5)

(require racket/pretty)

(pretty-print (queens 10)) ;; 시간이 좀 걸릴지도

(pretty-print (queens 25)) ;; 잠시동안 컴퓨터가 먹통이 되는 경험을 해보고싶다면?
