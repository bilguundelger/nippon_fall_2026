;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define temps (cons -5 (cons 0 (cons 12 empty))))
(define names (cons "Aki" (cons "Mina" (cons "Sora" empty))))
(define todo empty)
(define single (cons 100 empty))
temps
names
todo
single
;Ex02
;1.empty- тийм
;2 (cons 5 empty)-тийм
;3 (cons 5 6)-үгүй
;4 (cons 1 (cons 2 empty))-тийм
;5 (cons "a" empty)-үгүй
;6 (cons 1 (cons 2 3))-үгүй
;Ex03

;(first (cons 8 (cons 9 empty)))-8
;(rest (cons 8 (cons 9 empty)))-(cons 9 '())
;(rest (cons 8 empty))-'() empty list
;(first (rest (cons 7 (cons 8 (cons 9 empty)))))-8
;(empty? (rest (cons 5 empty)))-#true
;(cons? (rest (cons 5 empty)))-#false
;(first (rest (cons 5 empty)))-error: first:expects a non-empty list; given:'()

;Ex04
;; second-item : List-of-numbers -> Number
;; дор хаяж 2 элементтэй list-ийн хоёр дахь утга
(define (second-item numbers)
  (first (rest numbers)))

(check-expect (second-item (cons 4 (cons 7 empty))) 7)
(check-expect (second-item (cons 4 (cons 7 (cons 9 empty)))) 7)

;; sum-first-two : List-of-numbers -> Number
;; дор хаяж 2 элементтэй list-ийн эхний хоёр утгын нийлбэр

(define (sum-first-two numbers)
  (+ (first numbers)
     (first (rest numbers))))
(check-expect (sum-first-two (cons 4 (cons 7 (cons 9 empty)))) 11)

;; starts-with-zero? : List-of-numbers -> Boolean
;; хоосон биш, эхний утга нь 0 бол #t. Хоосон list дээр алдаа гаргахгүй байх ёстой.

(define (starts-with-zero? numbers)
  (if (empty? numbers)
      #f
      (= (first numbers) 0)))
(check-expect (starts-with-zero? empty) #f)
(check-expect (starts-with-zero? (cons 0 empty)) #t)
(check-expect (starts-with-zero? (cons 5 (cons 0 empty))) #f)

;; one-item? : List-of-numbers -> Boolean
;; яг нэг элементтэй бол #t

(define (one-item? numbers)
  (and (not (empty? numbers))
       (empty? (rest numbers))))

(check-expect (one-item? empty) #f)
(check-expect (one-item? (cons 1 empty)) #t)
(check-expect (one-item? (cons 1 (cons 2 empty))) #f)

;; first-two-beside : List-of-images -> Image
;; дор хаяж 2 зурагтай list-ийн эхний хоёрыг зүүнээс баруун тийш тавина
(require 2htdp/image)

(define shapes
  (cons (circle 20 "solid" "red")
        (cons (rectangle 40 40 "solid" "blue")
              (cons (triangle 30 "solid" "green") empty))))
(define (first-two-beside images)
  (beside (first images)
          (first (rest images))))

(check-expect (first-two-beside shapes)
              (beside (circle 20 "solid" "red") (rectangle 40 40 "solid" "blue")))

