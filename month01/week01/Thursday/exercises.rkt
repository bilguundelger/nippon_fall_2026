;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercises) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Exercise 1
(+ 8 7)
; Exercise 2
(* 6 4)
; Exercise 3
(- 17 9)
; Exercise 4
(/ 36 6)
; Exercise 5
(+ 12 9)
; Exercise 6
(* 3(+ 5 7))
; Exercise 7
( * 5(- 10 4))
; Exercise 8
(+ 3(/ 20 4))
; Exercise 9
(* (+ 6 4)(- 8 3))
; Exercise 10
(/ 20 4)
; Exercise 11
(+ (* 4 3) 7)
; Exercise 12
(* (+ 5 2) 4)
; Exercise 13
(+ 6 (* 3 5))
; Exercise 14
(+ 6 (* 3 5))
; Exercise 15
(* (+ 2 6) (- 10 3))
; Exercise 16
(define price 100)
price
; Exercise 17
(define age 20)
age
; Exercise 18
(define score 95)
score
; Exercise 19
(define temperature 25)
temperature

; Exercise 20
(define (double x)
  (* x 2))
( double 5)





(double 5)





; Exercise 21
(define (triple x)
  (* x 3))
(triple 4)

  
; Exercise 22
(define (square x)
  (* x x))
(square 5)
  
; Exercise 23
(define (half x)
  (/ x 2))
(half 10)
; Exercise 24
(define (add5 x)
  (+ x 5))

  (add5 7)
; Exercise 25
(define (add x y)
  (+ x y))
(add 3 7)

; Exercise 26
(define (multiply x y)
  (* x y))
(multiply 4 5)
; Exercise 27
(define (subtract x y)
  (- x y))
(subtract 10 4)
; Exercise 28
(define (divide x y)
  (/ x y))
(divide 20 4)
; Exercise 29
(define (rectangle-area width height)
  (* width height))
(rectangle-area 5 8)
; Exercise 30
(define ( total-price price quantity)
  (* price quantity))
(total-price 100 3)


 