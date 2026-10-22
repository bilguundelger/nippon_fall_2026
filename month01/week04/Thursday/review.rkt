;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Ex01
;; honor? : Student -> Boolean
;; эцсийн оноо 90 ба түүнээс дээш бол #true
(define-struct student (name quiz project))
(define aki  (make-student "Aki"  80 90))
(define sora (make-student "Sora"  60 60))
(define mina (make-student "Mina" 95 91))
(define ren  (make-student "Ren"  45 55))
(define (passing? s) (>= (final-score s) 60))
(define (final-score n)
  (+ (* 0.4 (student-quiz n))
     (* 0.6 (student-project n))))
(define (honor? t)
  (>= (final-score t) 90))
(check-expect (honor? mina) #true)
(check-expect (honor? aki) #false)
(check-expect (honor? (make-student "Nine" 90 90)) #true)
;; 2
;; swap-scores : Student -> Student
;; quiz ба project оноог сольсон шинэ сурагч
(define (swap-scores s)
  (make-student (student-name s)
                (student-project s)
                (student-quiz s)))
(check-expect (swap-scores aki) (make-student "Aki" 90 80))
(check-expect (swap-scores sora) sora)
;; 3
;; pass-label : Student -> Image
;; тэнцсэн бол ногоон "PASS", үгүй бол улаан "FAIL" (16)
(require 2htdp/image)
(define (card-color s) (if (passing? s) "green" "red"))
(define (letter-grade n)
  (cond [(>= n 90) "A"]
        [(>= n 80) "B"]
        [(>= n 70) "C"]
        [(>= n 60) "D"]
        [else "F"]))
(define (student-grade s) (letter-grade (final-score s)))
(define (student-card s) (overlay (above (text (student-name s) 18 "black") (text (student-grade s) 24 (card-color s))) (rectangle 120 70 "outline" (card-color s))))

(check-expect (pass-label aki) (text "PASS" 16 "green"))
(check-expect (pass-label ren) (text "FAIL" 16 "red"))
(define (pass-label s)
  (if (passing? s)
      (text "PASS" 16 "green")
      (text "FAIL" 16 "red")))

;(define-struct student (name quiz project))
;(define aki  (make-student "Aki"  80 90))
;(define sora (make-student "Sora"  60 60))
;(define mina (make-student "Mina" 95 91))
;(define ren  (make-student "Ren"  45 55))
;(define (passing? s) (>= (final-score s) 60))
;(define (swap-scores s)
 ; (make-student (student-name s)
  ;              (student-project s)
  ;              (student-quiz s)))
;(define (final-score n)
 ; (+ (* 0.4 (student-quiz n))
  ;   (* 0.6 (student-project n))))
;(define (honor? t)
;  (>= (final-score t) 90))
;(require 2htdp/image)
;(define (card-color s) (if (passing? s) "green" "red"))
;(define (letter-grade n)
 ; (cond [(>= n 90) "A"]
   ;     [(>= n 80) "B"]
   ;     [(>= n 70) "C"]
    ;    [(>= n 60) "D"]
     ;   [else "F"]))
;(define (student-grade s) (letter-grade (final-score s)))
;(define (student-card s) (overlay (above (text (student-name s) 18 "black") (text (student-grade s) 24 (card-color s))) (rectangle 120 70 "outline" (card-color s))))