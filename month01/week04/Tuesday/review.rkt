;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; sum-digits-3 : Number -> Number
;; гурван оронтой тооны цифрүүдийн нийлбэр. remainder, quotient ашигла.

(define (sum-digits-3 number)
  (+ (remainder number 10)
     (remainder (quotient number 10) 10)
     (quotient number 100)))
(check-expect (sum-digits-3 507) 12)
(check-expect (sum-digits-3 100) 1)
(check-expect (sum-digits-3 999) 27)
(sum-digits-3 507)

;; 2

;; quiz-gap : Student -> Number
;; quiz ба project онооны зөрүү (үргэлж эерэг). abs ашигла.
(define-struct student (name quiz project))
(define aki  (make-student "Aki"  80 90))
(define sora (make-student "Sora" 60 60))
(define mina (make-student "Mina" 95 91))
(define ren  (make-student "Ren"  45 55))

(define (quiz-gap number)
  (abs (- (student-quiz number) (student-project number))))
(check-expect (quiz-gap aki) 10)
(check-expect (quiz-gap sora) 0)
(check-expect (quiz-gap (make-student "Zul" 90 70)) 20)
;; count-a-scores : List-of-numbers -> Number
;; 90 ба түүнээс дээш оноо хэд байгааг тоолно
(define (count-a-scores number)
  (cond
    [(empty? number) 0]
    [(>= (first number) 90) (+ 1 (count-a-scores (rest number)))]
    [else
     (count-a-scores (rest number))]))
(check-expect (count-a-scores empty) 0)
(check-expect (count-a-scores (list 90 89 100)) 2)
