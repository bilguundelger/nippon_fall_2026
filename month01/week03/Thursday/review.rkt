;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; practice

;; 1


;; count-at-least : List-of-numbers Number -> Number
;; limit-ээс их буюу тэнцүү тоонуудын тоо

(check-expect (count-at-least empty 60) 0)
(check-expect (count-at-least (cons 60 (cons 59 empty)) 60) 1)
(check-expect (count-at-least (cons 60 (cons 70 (cons 50 empty))) 60) 2)

(define (count-at-least lon limit)
  (cond
    [(empty? lon) 0]
    [else
     (+ (if (>= (first lon) limit) 1 0)
        (count-at-least (rest lon) limit))]))

;; 2


;; smallest : NEList-of-numbers -> Number
;; хамгийн бага утгыг олно

(check-expect (smallest (cons 3 empty)) 3)
(check-expect (smallest (cons 5 (cons -1 (cons 4 empty)))) -1)

(define (smallest lon)
  (cond
    [(empty? (rest lon)) (first lon)]
    [else (min (first lon)
               (smallest (rest lon)))]))

;; 3


(require 2htdp/image)

;; draw-sizes : List-of-numbers -> Image
;; Тоо бүрийг радиус болгосон хар хүрээтэй тойргуудыг
;; зүүнээс баруун тийш байрлуулна

(check-expect (draw-sizes empty) empty-image)

(check-expect
 (draw-sizes (cons 10 (cons 20 empty)))
 (beside (circle 10 "outline" "black")
         (circle 20 "outline" "black")))

(define (draw-sizes lon)
  (cond
    [(empty? lon) empty-image]
    [else
     (beside (circle (first lon) "outline" "black")
             (draw-sizes (rest lon)))]))


