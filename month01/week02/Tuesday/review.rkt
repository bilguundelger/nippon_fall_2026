;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (kb-to-bytes A)
  (* A 1000))
(check-expect (kb-to-bytes 2) 2000)
(define (kb-to-bits A)
  (* A 8000))
(check-expect (kb-to-bits 2) 16000)
(define (kib-to-bits A)
  (* A 8192))
(check-expect (kib-to-bits 2) 16384)
; 2
(define (can-store? A B)
  (<= A B))
(check-expect (can-store? 500 512) #t)
(check-expect (can-store? 512 512) #t)
(check-expect (can-store? 513 512) #f)
;3
(define (cheap-order? A B)
  (< (* A B) 10000))
(check-expect (cheap-order? 2000 4) #t)
(check-expect (cheap-order? 2000 5) #f) 
 
