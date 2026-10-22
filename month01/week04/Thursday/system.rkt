;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname system) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
(define (honor? t)
  (>= (final-score t) 90))
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
(define students (list aki sora mina ren))
(define (fn-for-los l)
  (cond [(empty? l) ...]
        [else (... (fn-for-student (first l))
                   (fn-for-los (rest l)))]))
(define (better-student a b) (if (>= (final-score a) (final-score b)) a b))
(define (same-grade? a b) (string=? (student-grade a) (student-grade b)))
(define (points-to-pass s) (max 0 (- 60 (final-score s))))

(student-name (first students))
(first (rest students))
(final-score (first (rest (rest students))))
;(student-quiz students)
;; Ex03

;; 1
;; count-passing : List-of-students -> Number
;; тэнцсэн сурагчийн тоо
(define (count-passing n)
  (cond
    [(empty? n) 0]
    [else (if (passing? (first n)) (+ 1 (count-passing (rest n)))
              (count-passing (rest n)))]))
(check-expect (count-passing empty) 0)
(check-expect (count-passing students) 3)
(check-expect (count-passing (list ren)) 0)

;; 2

;; total-final : List-of-students -> Number
;; бүх сурагчийн эцсийн онооны нийлбэр

(define (total-final l)
  (cond
    [(empty? l) 0]
    [else
     (+ (final-score (first l)) (total-final (rest l)))]))
     
(check-expect (total-final empty) 0)
(check-expect (total-final students) 289.6)

;; 3

;; count-students : List-of-students -> Number
(define (count-students l)
  (cond
    [(empty? l) 0]
    [else
     (+ 1 (count-students (rest l)))]))
(check-expect (count-students empty) 0)
(check-expect (count-students students) 4)
;; Ex04

;; 1

;; passing-students : List-of-students -> List-of-students
;; зөвхөн тэнцсэн сурагчид

(define (passing-students l)
  (cond
    [(empty? l) empty]
    [else 
     (if (passing? (first l))
         (cons (first l) (passing-students (rest l)))
         (passing-students (rest l)))]))
    
(check-expect (passing-students empty) empty)
(check-expect (passing-students students) (list aki sora mina))
(check-expect (passing-students (list ren aki)) (list aki))

;;2

;; names : List-of-students -> List-of-strings
(define (names l)
  (cond
    [(empty? l) empty]
    [else
     (cons (student-name (first l))
           (names (rest l)))]))
     
(check-expect (names empty) empty)
(check-expect (names students) (list "Aki" "Sora" "Mina" "Ren"))

;; 3
;; grades : List-of-students -> List-of-strings
;; сурагч бүрийн үсгэн үнэлгээ
(define (grades l)
  (cond
    [(empty? l) empty]
    [else
     (cons (student-grade (first l))
     (grades (rest l)))]))
     
  
  
    
(check-expect (grades students) (list "B" "D" "A" "F"))
;; 4

;; bonus-all : List-of-students Number -> List-of-students
;; сурагч бүрийн project-д bonus нэмнэ (add-bonus)
(define (add-bonus s b) (make-student (student-name s)
                                      (student-quiz s)
                                      (min 100 (+ (student-project s) b))))
(define (bonus-all l b)
  (cond
    [(empty? l) empty]
    [else (cons (add-bonus (first l) b) (bonus-all (rest l) b))]))
(check-expect (bonus-all empty 10) empty)
(check-expect (bonus-all (list aki ren) 10)
              (list (make-student "Aki" 80 100) (make-student "Ren" 45 65)))
;; Ex05

;; 1

;; best-student : NEList-of-students -> Student
;; эцсийн оноо хамгийн их сурагч (тэнцүү бол түрүүлж байгаа нь)
(define (best-student l)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (better-student (first l)
     (best-student (rest l)))]))
(check-expect (best-student (list sora)) sora)
(check-expect (best-student students) mina)
;; 2


;; average-final : NEList-of-students -> Number
;; эцсийн онооны дундаж: total-final ба count-students-ийг дууд
(define (average-final l)
  (/ (total-final l) (count-students l)))
(check-expect (average-final (list aki)) 86)
(check-expect (average-final students) 72.4)

;; 3

;; top-name : NEList-of-students -> String
(define (top-name l)
  (student-name (best-student l)))
(check-expect (top-name students) "Mina")
;; Ex07

(define my-class (list aki sora mina ren
                       (make-student "bilde" 70 80)
                       (make-student "timmy" 58 61)))
(count-students my-class)
(count-passing my-class)
(total-final my-class)
(average-final my-class)
(top-name my-class)
(grades my-class)
;; 2

;; failing-students : List-of-students -> List-of-students
(define (failing-students l)
  (cond
    [(empty? l) empty]
    [else
     (if (passing? (first l))
         (failing-students (rest l))
         (cons (first l) (failing-students (rest l))))]))
(check-expect (failing-students empty) empty)
(check-expect (failing-students students) (list ren))

;; count-failing : List-of-students -> Number
(define (count-failing l) 
  (- (count-students l) (count-passing l)))
(check-expect (count-failing students) 1)






