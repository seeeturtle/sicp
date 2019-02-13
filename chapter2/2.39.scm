;; racket으로 한번 해보고 있습니다...
;; mit-scheme 말고 racket으로 돌려주세요.
;; 다른 scheme은 될지 모르겠네요.

(define (reverse seq)
  (foldr (lambda (x y) (append y (list x))) '() seq))

(reverse (list 1 2 3))

;; 진짜 scheme끼리 서로 구현이 너무 다른 것 같다.
;; mit-scheme은 fold-left에서 f(x, y)를 준다면
;; f(f(f(nil, 1), 2), 3) 이런식으로 한다면
;; racket의 foldl은 foldr과 비슷하지만 진행순서만 왼쪽에서 오른쪽이다.
;; f(3, f(2, f(1, nil)))
;; foldr는 같은 인자에 대해서 다음과 같이 실행될 것이다.
;; f(1, f(2, f(3, nil)))
;; 내가 보기에는 fold-left는 fold-right에다가 인자 시퀀스를 뒤집어서 넘기는 거 같은데
(define (reverse seq)
  (foldl cons '() seq))

(reverse (list 1 2 3))
