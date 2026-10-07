;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Thursday (2026-10-01) --comment (сэтгэгдэл)
; values --утга
5
-6
1.6
"Hello World"
true

; arimethic operation
(+ 3 4)
(- 10 6)
(* 5 8)
(/ 20 4)
(+ 100 50)
(- 30 12)
(* 7 6)
(/ 81 9)
(= 1 2 3)
(+ 10 20 30)
(* 2 3 4)
(- 20 5 3)
(/ 100 2 5)
;nested expression
(+ (* 2 3) 4)

;(* 2 3 -> syntax error
( * 2 3)
; (* 4)
; (sign operator operand)
(+ 2 3)

; define тодорхойлох
(define age 19)
age ; variable хувьсагч

; Examples : өөрийнхөө нэр болоод мэргэжлийг тодорхойлоод утга оноогоод хэвлэж харуулна уу
(define name "bilguundelger")
name ; call/usage
(define job "software engineer")
job

; width, height гэдгийг тодорхойлоод 4 5 утгууд онооно уу
; тухайн нэрнүүдийг ашиглан тоонуудын нийлбэрийг олно уу.
; Expected outup 9 байх ёстой.
; Дараа нь үржүүлээд үр дүнг нь 20 болго
(define width 5)
(define height 5)
(+ width height)
(* width height)
(define price 100)
(define quantity 3)
(* price quantity)
(define salary 1500)
(define bonus 300)
(+ salary bonus)

;
(* height height)
(* width width)

;; Functions
;; square gedeg funkts todorhoiloh
;; x-iig funktsiin parametr
;; INPUT -x
;; Function process -> (* x x)
(define (square x)
  (* x x) )

;; output
(square 5)
(square 12421414214412412414)

;; double nertei 1 parametr avaad tuunii utgiig doublddg funkts bichne uu
;; tuuniigee 4, 8, -35 gedeg argumentuudaar testlej ur dung ni shalgaarai.
;; Expected output : 4->8,

(define (double x)
  (+ x x) )
(double 4)
(double 8)
(double -35)
(define (triple x)
  (* 3 x))
(triple 3)
(triple 5)
(define (add-ten x)
  (+ 10 x))


(add-ten 10)

;; Multiple paratmeters
;; two parametered function

(define (calculate-area-rectangle width heght)
  (* width height))

(calculate-area-rectangle 5 6)

;; calculate-perimeter-rectangle funkts
;; P = 2 * (a + b)
(define (calculate-perimetr-rectangle a b)
  ( * 2 (+ a b)))
(calculate-perimetr-rectangle 10 5)
(define (calculate-circle-area radius)
  (* 3.14 radius))
(calculate-circle-area 10)  
;; calculate-circle-area funkts bichih
;; A = 3.14 * radius * radius





