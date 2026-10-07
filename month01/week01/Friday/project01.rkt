;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname project03) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
 ; Функцийн нэр: average3
 ; Оролт: score1 score2 score
 ; Гаралт: average3
 ; Томьёо: 3/(score1+score2+score3)
(define (average3 score1 score2 score3)
  (/ (+ score1 score2 score3) 3))

(average3 10 10 10)
; Функцийн нэр: homework-total
 ; Оролт: homework1 homework2 homework3 homework4
 ; Гаралт:total 
 ; Томьёо:homework1+homework2+homework3+homework4 

(define (homework-total homework1 homework2 homework3 homework4)
  (+ homework1 homework2 homework3 homework3))
(homework-total 70 77 85 90)
; Функцийн нэр:exam-total
 ; Оролт:exam1 exam2 exam3
 ; Гаралт:total
 ; Томьёо:exam1+exam2+exam3
(define (exam-total exam1 exam2 exam3)
  (+ exam1 exam2 exam3))
(exam-total 80 83 81)
; Функцийн нэр:overall-score
 ; Оролт:homework-total exam-total 
 ; Гаралт:score
 ; Томьёо:homework-total+exam+total
(define (overall-score homework-total exam-total)
  (+ homework-total exam-total))
(overall-score 217 311)
; Функцийн нэр:points-percentage
 ; Оролт:points-earned total-points 
 ; Гаралт:percentage
 ; Томьёо:2x(points-earned/total-points)
(define (points-percentage points-earned total-points)
  (* (/ points-earned total-points) 2))
(points-percentage 221 414)
; Функцийн нэр:average5 
 ; Оролт:score1 score2 score3 score4 score5 
 ; Гаралт:average5
 ; Томьёо:5/(score1+score2+score3+score4+score5)
(define (average5 score1 score2 score3 score4 score5)
  (/ (+ score1 score2 score3 score4 score5) 5))
(average5 121 123 14 55 56)
(average3 10 20 30)
