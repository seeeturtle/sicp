(define (make-segment s e)
  (cons s e))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (length-segment s)
  (sqrt
   (+
    (square (- (x-point (start-segment s))
               (x-point (end-segment s))))
    (square (- (y-point (start-segment s))
               (y-point (end-segment s)))))))

;; (length-segment (make-segment
;;                  (make-point 1 2)
;;                  (make-point 4 6)))

(define (average x y)
  (/ (+ x y) 2))

(define (midpoint-segment s)
  (make-point
   (average (x-point (start-segment s)) (x-point (end-segment s)))
   (average (y-point (start-segment s)) (y-point (end-segment s)))))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (area r)
  (* (width-rect r) (height-rect r)))

(define (perimeter r)
  (* 2 (+ (width-rect r) (height-rect r))))

;; (1) 밑변과 높이 선분으로 정의한 직사각형.
(define (make-rect w h)
  (cons w h))

(define (width-rect r)
  (length-segment (car r)))

(define (height-rect r)
  (length-segment (cdr r)))

(define r (make-rect
           (make-segment
            (make-point 1 1)
            (make-point 2 1))
           (make-segment
            (make-point 1 1)
            (make-point 1 2))))

(area r)
(perimeter r)

;; (2) 한 대각선을 갖고, 밑변과 높이가 각각 x, y 축에 평행한 직사각형
(define (make-rect d) d)

(define (width-rect r)
  (let ((midpoint (midpoint-segment r)))
    (* 2 (abs (- (x-point midpoint) (x-point (start-segment r)))))))

(define (height-rect r)
  (let ((midpoint (midpoint-segment r)))
    (* 2 (abs (- (y-point midpoint) (y-point (start-segment r)))))))

(define r (make-rect
           (make-segment
            (make-point 1 1)
            (make-point 2 2))))

(area r)
(perimeter r)
