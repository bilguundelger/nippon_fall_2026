;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; struct
;;

(define-struct book (title author pages))
(define b1 (make-book "Harry Potter" "Rowling" 320))
(define b2 (make-book "Бяцхан ханхүү" "Exupéry" 96))
(define b3 (make-book "Нууц товчоо" "Тодорхойгүй" 300))
(book-title b2)
(book-pages b3)
(book-author b1)

;; 2
(define (long-book? book)
  (> (book-pages book) 300))
(check-expect (long-book? b1) #true)
(check-expect (long-book? b2) #false)
(check-expect (long-book? b3) #false)   ; яг 300
(check-expect (long-book? (make-book "A" "B" 301)) #true)

;; 3

(define (reading-days book)
  (/ (book-pages book) 20))
  
  
(check-expect (reading-days b1) 16)
(check-expect (reading-days b2) 4.8)
(check-expect (reading-days b3) 15)

(define-struct pet (name kind age))


(define bobo (make-pet "Бобо" "нохой" 3))
(define mimi (make-pet "Мими" "муур" 1))
(define tom  (make-pet "Том"  "муур" 12))
(define (cat? pet)
  (string=? (pet-kind pet) "муур"))


(check-expect (cat? mimi) #true)
(check-expect (cat? tom) #true)
(check-expect (cat? bobo) #false) 

(define (senior? pet)
  (>= (pet-age pet) 10))
  
 

(check-expect (senior? tom) #true)
(check-expect (senior? bobo) #false)
(check-expect (senior? (make-pet "Хар" "нохой" 10)) #true)
(check-expect (senior? (make-pet "Цагаан" "муур" 9)) #false)

(define (pet-intro pet)
  (string-append (pet-name pet) " бол "
                 (number->string (pet-age pet)) " настай "
                 (pet-kind pet)))


(check-expect (pet-intro bobo) "Бобо бол 3 настай нохой")
(check-expect (pet-intro mimi) "Мими бол 1 настай муур")
(check-expect (pet-intro tom) "Том бол 12 настай муур")


;; 3

(define-struct product (name price qty))
;; a product is (make-product string number number)

(define pen      (make-product "Үзэг"   500   40))
(define notebook (make-product "Дэвтэр" 1500  0))
(define bag      (make-product "Цүнх"   45000 3))

(define (stock-value p)
  (* (product-price p) (product-qty p)))

(check-expect (stock-value pen) 20000)
(check-expect (stock-value bag) 135000)
(check-expect (stock-value notebook) 0)
(define (in-stock? p)
  (> (product-qty p) 0))

(check-expect (in-stock? pen) #true)
(check-expect (in-stock? bag) #true)
(check-expect (in-stock? notebook) #false)
(define (price-with-tax p)
  (* (product-price p) 1.1))

(check-expect (price-with-tax pen) 550)
(check-expect (price-with-tax notebook) 1650)
(check-expect (price-with-tax bag) 49500)

;; Ex04

(require 2htdp/image)
(define-struct ball (radius color))
(define red-ball (make-ball 20 "red"))
(define big-blue (make-ball 50 "blue"))
(define tiny (make-ball 5 "green"))
(define (draw-ball image)
  (circle (ball-radius image) "solid" (ball-color image)))

(check-expect (draw-ball red-ball) (circle 20 "solid" "red"))
(check-expect (draw-ball big-blue) (circle 50 "solid" "blue"))

(define (bigger? a b)
  (> (ball-radius a) (ball-radius b)))
(check-expect (bigger? big-blue red-ball) #true)
(check-expect (bigger? red-ball tiny) #true)
(check-expect (bigger? tiny red-ball) #false)
(check-expect (bigger? red-ball red-ball) #false)

;; ball-in-box

(define (ball-in-box ball)
  (overlay (draw-ball ball) (square (+ (* (ball-radius ball) 2) 10) "outline" "black")))
(check-expect (ball-in-box red-ball)
              (overlay (circle 20 "solid" "red") (square 50 "outline" "black")))
(check-expect (ball-in-box tiny)
              (overlay (circle 5 "solid" "green") (square 20 "outline" "black")))

;; Ex05

(define-struct game (home away home-goals away-goals))
(define g1 (make-game "Монгол" "Япон" 1 0))     
(define g2 (make-game "Хятад" "Солонгос" 0 3))


(check-expect (game? g1) #true)
(check-expect (game-home g1) "Монгол")
(check-expect (game-away g2) "Солонгос")
(check-expect (game-away-goals g2) 3)

;; total-goals

(define (total-goals goal)
  (+ (game-home-goals goal) (game-away-goals goal)))
(check-expect (total-goals g1) 1)
(check-expect (total-goals g2) 3)

;; winner
(define (winner w)
  (cond
    [(> (game-home-goals w) (game-away-goals w)) (game-home w)]
    [(< (game-home-goals w) (game-away-goals w)) (game-away w)]
    [else "тэнцээ"]))
    
(check-expect (winner g1) "Монгол")
(check-expect (winner g2) "Солонгос")
(check-expect (winner (make-game "A" "B" 0 0)) "тэнцээ")

(define (score-line game)
  (string-append (game-home game) " " (number->string (game-home-goals game)) " : "
                 (number->string (game-away-goals game)) " " (game-away game)))

(check-expect (score-line g1) "Монгол 1 : 0 Япон")
(check-expect (score-line g2) "Хятад 0 : 3 Солонгос")
;(check-expect (score-line g3) "Монгол 1 : 1 Хятад")

;; 6

(define-struct student (name quiz project))
(define Aki (make-student "Aki" 80 90))
(define sora (make-student "sora" 60 60))
(define mina (make-student "mina" 95 91))
(define ren (make-student "ren" 45 55))

(define (final-score student)
  (+ (* (student-quiz student) 0.4)
     (* (student-project student) 0.6)))

(check-expect (final-score Aki) 86)
(check-expect (final-score sora) 60)
(check-expect (final-score mina) 92.6)
(check-expect (final-score ren) 51)

(define (passed? student)
  (>= (final-score student) 60))

(check-expect (passed? Aki) #true)
(check-expect (passed? sora) #true)
(check-expect (passed? mina) #true)
(check-expect (passed? ren) #false)
(check-expect (passed? (make-student "Uka" 100 34)) #true)
(check-expect (passed? (make-student "Bat" 100 33)) #false)













               







  

