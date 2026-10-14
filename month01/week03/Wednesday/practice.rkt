;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;1

;; contains? : Number List-of-numbers -> Boolean
;; target list дотор байвал #t

(define (contains? target l)
  (cond
    [(empty? l) #f]
    [(cons? l)
     (or (= target (first l))
         (contains? target (rest l)))]))

(check-expect (contains? 5 empty) #f)
(check-expect (contains? 5 (cons 3 (cons 5 (cons 7 empty)))) #t)
(check-expect (contains? 4 (cons 3 (cons 5 empty))) #f)

;; 2

;; count-greater-than : List-of-numbers Number -> Number
;; limit-ээс их тоонуудын тоог олно

(define (count-greater-than l limit)
  (cond
    [(empty? l) 0]
    [(cons? l)
     (if (> (first l) limit)
         (+ 1 (count-greater-than (rest l) limit))
         (count-greater-than (rest l) limit))]))

(check-expect (count-greater-than empty 5) 0)
(check-expect (count-greater-than (cons 2 (cons 8 (cons 10 empty))) 5) 2)
(check-expect (count-greater-than (cons 5 (cons 6 empty)) 5) 1)

;;3


;; find-max : NEList-of-numbers -> Number
;; Хамгийн их утгыг олно

(define (find-max l)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (max (first l)
          (find-max (rest l)))]))

(check-expect (find-max (cons 70 empty)) 70)
(check-expect (find-max (cons 70 (cons 95 (cons 63 empty)))) 95)
(check-expect (find-max (cons -5 (cons -2 empty))) -2)

;; 4

;; sum : List-of-numbers -> Number
(define (sum l)
  (cond
    [(empty? l) 0]
    [(cons? l)
     (+ (first l)
        (sum (rest l)))]))

;; count-items : List-of-numbers -> Number
(define (count-items l)
  (cond
    [(empty? l) 0]
    [(cons? l)
     (+ 1 (count-items (rest l)))]))

;; average : NEList-of-numbers -> Number
(define (average l)
  (/ (sum l)
     (count-items l)))

(check-expect (average (cons 80 empty)) 80)
(check-expect
 (average (cons 70 (cons 82 (cons 95 (cons 63 (cons 88 empty))))))
 79.6)