;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct student (name quiz project))
(define aki  (make-student "Aki"  80 90))
(define sora (make-student "Sora"  60 60))
(define mina (make-student "Mina" 95 91))
(define ren  (make-student "Ren"  45 55))
(define (passing? s) (>= (final-score s) 60))
(define (swap-scores s)
  (make-student (student-name s)
                (student-project s)
                (student-quiz s)))
(define (final-score n)
  (+ (* 0.4 (student-quiz n))
     (* 0.6 (student-project n))))
(define (letter-grade n)
  (cond [(>= n 90) "A"]
        [(>= n 80) "B"]
        [(>= n 70) "C"]
        [(>= n 60) "D"]
        [else "F"]))
(define (count-passing n)
  (cond
    [(empty? n) 0]
    [else (if (passing? (first n)) (+ 1 (count-passing (rest n)))
              (count-passing (rest n)))]))
(define (student-grade s) (letter-grade (final-score s)))
(check-expect (count-at-least empty 50) 0)
(check-expect (count-at-least students 80) 2)
(check-expect (count-at-least students 0) 4)
;; count-at-least : List-of-students Number -> Number
;; эцсийн оноо нь n ба түүнээс дээш сурагчийн тоо
(define (count-at-least los n)
  (cond
    [(empty? los) 0]
    [else (if (>= (final-score (first los)) n)
              (+ 1 (count-at-least (rest los) n))
              (count-at-least (rest los) n))]))
(check-expect (names-with-grade students "A") (list "Mina"))
(check-expect (names-with-grade students "C") empty)
(check-expect (names-with-grade empty "A") empty)

;; names-with-grade : List-of-students String -> List-of-sztrings
;; өгөгдсөн үнэлгээтэй сурагчдын нэр
(define (names-with-grade los grade)
  (cond
    [(empty? los) empty] 
    [else (if (string=? (student-grade (first los)) grade)
              (cons (student-name (first los)) (names-with-grade (rest los) grade))
              (names-with-grade (rest los) grade))]))

;; grade-row : List-of-students -> Image
;; сурагч бүрт радиус 10 тойрог: тэнцсэн бол ногоон, үгүй бол улаан
(require 2htdp/image)
(define (grade-row los)
  (cond
    [(empty? los) empty-image]
    [else (beside (circle 10 "solid" 
                          (if (>= (final-score (first los)) 60) "green" "red"))
                  (grade-row (rest los)))]))
(check-expect (grade-row empty) empty-image)
(check-expect (grade-row (list aki ren))
              (beside (circle 10 "solid" "green") (circle 10 "solid" "red")))