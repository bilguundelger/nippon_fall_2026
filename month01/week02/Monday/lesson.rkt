;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (passing-score? N)
  (>= N 60))
(check-expect (passing-score? 60) #t)
(check-expect (passing-score? 59)#f)
;; passing-score? : Number -> Boolean
;; score 60 ба түүнээс дээш бол #t
;; fits-in-byte? : Number -> Boolean
;; сөрөг биш бүхэл n нэг byte (8 bit, 0–255)-д багтах уу

(define (fits-in-byte? N)
  
