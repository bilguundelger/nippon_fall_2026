;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; sergeeh

;; 1

;; scale-all : List-of-numbers Number -> List-of-numbers
;; тоо бүрийг factor-оор үржүүлнэ

(define (scale-all a b)
  (cond
    [(empty? a) empty]
    [else (cons (* (first a) b)
                (scale-all (rest a) b))]))

       
(check-expect (scale-all empty 10) empty)
(check-expect (scale-all (list 1 2) 10) (list 10 20))

;; best-grade : NEList-of-numbers -> String
;; хамгийн их онооны үсгэн дүн. Пүрэвийн highest, 2-р долоо хоногийн letter-grade-г дууд.


(define (letter-grade score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))
(define (highest n)
  (cond
    [(empty? (rest n)) (first n)]
    [else (max (first n) (highest (rest n)))]))
(define (best-grade n)
  (letter-grade (highest n)))

(check-expect (best-grade (list 70 95)) "A")
(check-expect (best-grade (list 59)) "F")

 ;; badge-row : List-of-numbers -> Image
;; оноо бүрийг 2-р долоо хоногийн pass-fail-badge-аар (60+ ногоон, бусад улаан, радиус 20) зүүнээс баруун тийш
(require 2htdp/image)

(define (pass-fail-badge score)
  (if (>= score 60)
      (circle 20 "solid" "green")
      (circle 20 "solid" "red")))
(define (badge-row l)
  (cond
    [(empty? l) empty-image]
    [else (beside (pass-fail-badge (first l))
                 (badge-row (rest l)))]))

(check-expect (badge-row empty) empty-image)
(check-expect (badge-row (list 60 59))
              (beside (circle 20 "solid" "green") (circle 20 "solid" "red")))