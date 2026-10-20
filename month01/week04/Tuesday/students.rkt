;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname students) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; final-score : Student -> Number
;; эцсийн оноо: quiz 40%, project 60%

;(define (final-score s)
 ; (... (student-name s)
  ;     (student-quiz s)
   ;    (student-project s)))
(define-struct student (name quiz project))
;; A Student is (make-student String Number Number)
;; name    : сурагчийн нэр
;; quiz    : quiz оноо, 0–100
;; project : project оноо, 0–100

(define aki  (make-student "Aki"  80 90))
(define sora (make-student "Sora"  60 60))
(define mina (make-student "Mina" 95 91))
(define ren  (make-student "Ren"  45 55))

(define (final-score n)
  (+ (* 0.4 (student-quiz n))
     (* 0.6 (student-project n))))
(check-expect (final-score aki) 86)
(check-expect (final-score sora) 60)
(check-expect (final-score mina) 92.6)
(check-expect (final-score (make-student "Q" 100 0)) 40)
(check-expect (final-score (make-student "P" 0 100)) 60)

;; 2

(final-score ren)
(final-score (make-student "Edge" 59 61))
(final-score (make-student "Low" 61 59))

;; 3

;; passing? : Student -> Boolean
;; эцсийн оноо 60 ба түүнээс дээш бол #true
(define (passing? boolean)
  (>= (final-score boolean) 60))
(check-expect (passing? sora) #true)                          ; яг 60
(check-expect (passing? ren) #false)
(check-expect (passing? (make-student "Edge" 59 61)) #true)   ; 60.2
(check-expect (passing? (make-student "Low" 61 59)) #false)   ; 59.8

;; student-grade : Student -> String
;; эцсийн онооны үсгэн үнэлгээ
(define (letter-grade n)
  (cond [(>= n 90) "A"]
        [(>= n 80) "B"]
        [(>= n 70) "C"]
        [(>= n 60) "D"]
        [else "F"]))

(define (student-grade student)
  (letter-grade (final-score student)))
(check-expect (student-grade aki) "B")
(check-expect (student-grade sora) "D")
(check-expect (student-grade mina) "A")
(check-expect (student-grade ren) "F")
(check-expect (student-grade (make-student "Nine" 90 90)) "A")

(define (rename s new-name)
  (make-student new-name
                (student-quiz s)
                (student-project s)))

(rename aki "Akira")   ; → (make-student "Akira" 80 90)
aki                    ; → (make-student "Aki" 80 90)

;; add-bonus
;; add-bonus : Student Number -> Student
;; project оноонд bonus нэмнэ, гэхдээ 100-аас хэтрэхгүй (min ашигла)
(define (add-bonus s b) (make-student (student-name s) (student-quiz s) (min 100 (+ (student-project s) b))))

(check-expect (add-bonus aki 5) (make-student "Aki" 80 95))
(check-expect (add-bonus mina 20) (make-student "Mina" 95 100))
(check-expect (add-bonus ren 0) ren)

;; retake-quiz : Student Number -> Student
;; quiz-ийг дахин өгсөн: шинэ оноо их бол түүнийг, үгүй бол хуучныг үлдээнэ (max)
(define (retake-quiz s b)
  (make-student (student-name s) (max b (student-quiz s)) (student-project s)))
(check-expect (retake-quiz ren 70) (make-student "Ren" 70 55))
(check-expect (retake-quiz aki 50) aki)

;(final-score (add-bonus ren 10))->57
;(passing? (retake-quiz ren 70))->#true
;(student-project aki)->90
;(add-bonus aki 5)->(make-student "Aki" 80 95)

;; Ex06
;; card-color : Student -> String
;; тэнцсэн бол "green", үгүй бол "red"
(require 2htdp/image)
(define (card-color s)
  (if (passing? s) "green" "red"))
(check-expect (card-color aki) "green")
(check-expect (card-color ren) "red")

;; 2

;; student-card : Student -> Image
;; нэр (18, хар), доор нь үсгэн үнэлгээ (24, card-color), card-color хүрээ (120 × 70)
(define (student-card s) (overlay (above (text (student-name s) 18 "black") (text (student-grade s) 24 (card-color s))) (rectangle 120 70 "outline" (card-color s))))

  
(check-expect (student-card aki)
              (overlay (above (text "Aki" 18 "black") (text "B" 24 "green"))
                       (rectangle 120 70 "outline" "green")))
(check-expect (student-card ren)
              (overlay (above (text "Ren" 18 "black") (text "F" 24 "red")) 
                       (rectangle 120 70 "outline" "red")))

;(final-score aki)-86
;(final-score sora)-60
;(final-score mina)-92.6
;(final-score ren)-51
;(passing? aki)-true
;(passing? sora)-true 
;(passing? mina)-true
;(passing? ren)-false



