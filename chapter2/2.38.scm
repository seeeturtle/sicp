(fold-right / 1 (list 1 2 3))
(/ 1 (/ 2 (/ 3 1)))

(fold-left / 1 (list 1 2 3))
(/ (/ (/ 1 1) 2) 3)

(fold-right list () (list 1 2 3))
(list 1 (list 2 (list 3 ())))

(fold-left list () (list 1 2 3))
(list (list (list () 1) 2) 3)

;; fold-right와 fold-left의 결과값이 같으려면
;; 연산자가 결합법칙이 성립하면?
;; a + (b + (c + ...))
;; (a + b) + (c + (d + ...))
;; ((a + b) + c) + (d + ...)
;; (((a + b) + c) + d) + (e + ...)

(= (fold-right + 0 (list 1 2 3)) (fold-left + 0 (list 1 2 3)))
(= (fold-right * 4 (list 1 2 3)) (fold-left * 4 (list 1 2 3)))
