;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname recursion) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;2 recursion and template

;; List-of-numbers is one of:
;; – empty
;; – (cons Number List-of-numbers)

;; fun-for-lon : List-of-numbers -> ???
;(define (fun-for-lon l)
 ; (cond
  ;  [(empty? l) ...]
   ; [else (... (first l)
    ;           ... (fun-for-lon (rest l)) ...)]))
;Ex03

;1.(sum (cons 4 (cons 5 empty)))-ийг дээрх шиг мөр мөрөөр trace хий.
;2.(sum empty) яагаад 0 вэ? 1 байсан бол (sum (cons 4 empty)) хэд болох вэ?
;3.(sum (cons 10 empty))-д sum нийт хэдэн удаа дуудагдах вэ?
;1 - (+ 4 (+ 5 0)=9
;2 - 5
;3 2

;Ex04

;; count-items : List-of-numbers -> Number
;; элементийн тоо
(define (count-items l)
  (cond
    [(empty? l) 0]
    [else (+ 1 (count-items (rest l)))]))


(check-expect (count-items empty) 0)
(check-expect (count-items (cons 7 (cons 8 (cons 9 empty)))) 3)

;; product : List-of-numbers -> Number
;; бүх тооны үржвэр. Хоосон list-ийн үржвэр 1 (0 биш!) — яагаад?

(define (product l)
  (cond
    [(empty? l) 1]                       
    [else (* (first l) (product (rest l)))]))
(check-expect (product empty) 1)
(check-expect (product (cons 2 (cons 3 (cons 4 empty)))) 24)

;; contains-zero? : List-of-numbers -> Boolean
;; list дотор 0 байвал #t. or ашигла.
(define (contains-zero? boolean)
  (cond
    [(empty? boolean) #f]                       
    [else (or (= (first boolean) 0) (contains-zero? (rest boolean)))]))

(check-expect (contains-zero? empty) #f)
(check-expect (contains-zero? (cons 1 (cons 0 empty))) #t)
(check-expect (contains-zero? (cons 1 (cons 2 empty))) #f)

;Ex05

;; count-even : List-of-numbers -> Number
;; тэгш тоонуудын тоо

;; count-even : List-of-numbers -> Number
;; Тэгш тоонуудын тоог олно.

(define (count-even numbers)
  (cond
    [(empty? numbers) 0]
    [(even? (first numbers))
     (+ 1 (count-even (rest numbers)))]
    [else
     (count-even (rest numbers))]))

(check-expect (count-even empty) 0)
(check-expect (count-even (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))))) 3)
(check-expect (count-even (cons 1 (cons 3 empty))) 0)

;; count-negative : List-of-numbers -> Number
;; сөрөг тоонуудын тоо (0 сөрөг биш)


(define (count-negative numbers)
  (cond
    [(empty? numbers) 0]
    [(< (first numbers) 0)
     (+ 1 (count-negative (rest numbers)))]
    [else
     (count-negative (rest numbers))]))
    
(check-expect (count-negative (cons -1 (cons 0 (cons -3 empty)))) 2)

;Ex06

;; draw-all : List-of-images -> Image
;; бүх зургийг зүүнээс баруун тийш тавина
(require 2htdp/image)

(define (draw-all imgs) (cond [(empty? imgs) empty-image] [else (beside (first imgs) (draw-all (rest imgs)))]))
(check-expect (draw-all empty) empty-image)
(check-expect (draw-all (cons (circle 20 "solid" "red")
                              (cons (rectangle 40 40 "solid" "blue") empty)))
              (beside (circle 20 "solid" "red") (rectangle 40 40 "solid" "blue")))

 