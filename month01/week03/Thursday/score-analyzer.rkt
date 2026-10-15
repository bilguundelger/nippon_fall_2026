;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname score-analyzer) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;racket
;; =========================================
;; Score examples
;; =========================================

;; 2 жишээ list. Эхнийх нь бүгд тэнцсэн,
;; хоёр дахь нь тэнцээгүй оноотой.
(define scores (list 70 82 95 63 88))
(define mixed-scores (list 40 60 72 58 100))


;; =========================================
;; 1. total
;; List-of-numbers -> Number
;; Жагсаалт дахь бүх тоог нэмнэ.
;; =========================================

(define (total l)
  (cond
    [(empty? l) 0]
    [else
     (+ (first l)
        (total (rest l)))]))

(check-expect (total empty) 0)
(check-expect (total (list 10)) 10)
(check-expect (total (list 10 20 30)) 60)
(check-expect (total scores) 398)
(check-expect (total mixed-scores) 330)


;; =========================================
;; 2. count-scores
;; List-of-numbers -> Number
;; Жагсаалт дахь онооны тоог тоолно.
;; =========================================

(define (count-scores l)
  (cond
    [(empty? l) 0]
    [else
     (+ 1
        (count-scores (rest l)))]))

(check-expect (count-scores empty) 0)
(check-expect (count-scores (list 70)) 1)
(check-expect (count-scores scores) 5)
(check-expect (count-scores mixed-scores) 5)


;; =========================================
;; 3. average
;; NEList-of-numbers -> Number
;; Жагсаалтын дундаж оноог олно.
;; =========================================

(define (average l)
  (/ (total l)
     (count-scores l)))

(check-expect (average scores) 79.6)
(check-expect (average mixed-scores) 66)


;; =========================================
;; 4. highest
;; NEList-of-numbers -> Number
;; Жагсаалтын хамгийн их тоог олно.
;; =========================================

(define (highest l)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (max (first l)
          (highest (rest l)))]))

(check-expect (highest (list 63)) 63)
(check-expect (highest scores) 95)
(check-expect (highest mixed-scores) 100)


;; =========================================
;; 5. count-passing
;; List-of-numbers -> Number
;; 60 ба түүнээс дээш онооны тоог тоолно.
;; =========================================

(define (count-passing l)
  (cond
    [(empty? l) 0]
    [(>= (first l) 60)
     (+ 1 (count-passing (rest l)))]
    [else
     (count-passing (rest l))]))

(check-expect (count-passing empty) 0)
(check-expect (count-passing scores) 5)
(check-expect (count-passing mixed-scores) 3)
(check-expect (count-passing (list 60 59)) 1)


;; =========================================
;; 6. count-failing
;; List-of-numbers -> Number
;; 60-аас бага онооны тоог тоолно.
;; =========================================

(define (count-failing l)
  (cond
    [(empty? l) 0]
    [(< (first l) 60)
     (+ 1 (count-failing (rest l)))]
    [else
     (count-failing (rest l))]))

(check-expect (count-failing empty) 0)
(check-expect (count-failing scores) 0)
(check-expect (count-failing mixed-scores) 2)
(check-expect (count-failing (list 59 60 40)) 2)


;; =========================================
;; 7. score-bars
;; List-of-numbers -> Image
;; Оноо бүрийг дээрээс доош цэнхэр
;; тэгш өнцөгтөөр зурна.
;; Хоосон жагсаалт бол empty-image.
;; =========================================

(require 2htdp/image)
;; passing-scores : List-of-numbers -> List-of-numbers
;; 60 ба түүнээс дээш оноотой оноонуудыг буцаана.

(define (passing-scores l)
  (cond
    [(empty? l) empty]
    [(>= (first l) 60)
     (cons (first l)
           (passing-scores (rest l)))]
    [else
     (passing-scores (rest l))]))

(define (score-bars l)
  (cond
    [(empty? l) empty-image]
    [else
     (above
      (rectangle (first l) 20 "solid" "blue")
      (score-bars (rest l)))]))

;; Test table

(check-expect (total scores) 398)
(check-expect (total mixed-scores) 330)

(check-expect (average scores) 79.6)
(check-expect (average mixed-scores) 66)

(check-expect (highest scores) 95)
(check-expect (highest mixed-scores) 100)

(check-expect (count-passing scores) 5)
(check-expect (count-passing mixed-scores) 3)

(check-expect (count-failing scores) 0)
(check-expect (count-failing mixed-scores) 2)

(check-expect (passing-scores scores) scores)
(check-expect (passing-scores mixed-scores)
              (list 60 72 100))




