;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Tuesday Week 02
;; Boolean operation

;; and, or, not

;; Exercises
(check-expect (and #t #t) #t)
(check-expect (and #t #f) #f)
(check-expect (or #f #f) #f)
(check-expect (or #f #t) #t)
(check-expect (not #t) #f)
(check-expect (not #f) #t)
 ;; Ex01
(define (in-range? a)
  (and (>= a 1) (<= a 10)))
(check-expect (in-range? 5) #t)
(check-expect (in-range? 1) #t)
(check-expect (in-range? 10) #t)
(check-expect (in-range? 0) #f)
(check-expect (in-range? 11) #f)

;; Ex02
(define (teen? age)
  (and (>= age 13) (<= age 19)))

(check-expect (teen? 13) #t)
(check-expect (teen? 19) #t)
(check-expect (teen? 12) #f)
(check-expect (teen? 20) #f)
;; Ex03

(define (Weekend? day)
  (or (>= day 6) (= 7 day)))
(check-expect (Weekend? 6) #t)
(check-expect (Weekend? 7) #t)
(check-expect (Weekend? 5) #f)

;; Ex04

(define (not-passing? score)
  (not (>= score 60)))
(check-expect (not-passing? 59) #t)
(check-expect (not-passing? 60) #f)

;; Ex05
(define (scholarship? score attendance)
  (and (>= score 90) (>= attendance 80)))
(check-expect (scholarship? 90 80) #t)

;; IF
(define (adult-or-minor age)
  (if (>= age 18)
      "adult"
      "minor"))
(check-expect (adult-or-minor 30) "adult")
(check-expect (adult-or-minor 18) "adult")
(check-expect (adult-or-minor 17) "minor")

(define (even-or-odd number)
  (if (even? number)
      "even"
      "odd"))
(check-expect (even-or-odd 4) "even")
(check-expect (even-or-odd 7) "odd")
(check-expect (even-or-odd 100) "even")

;; pass-or-fail : Number -> String
;; score 60 ба түүнээс дээш бол "pass", үгүй бол "fail"
(define (pass-or-fail score)
  (if (>= score 60)
      "pass"
      "fail"))




(check-expect (pass-or-fail 60) "pass")
(check-expect (pass-or-fail 59) "fail")
;; shipping-fee : Number -> Number
;; захиалгын дүн 50000 ба түүнээс их бол хүргэлт 0, үгүй бол 3000
(define (shipping-fee number)
  (if (>= number 50000)
      0
      3000))
      
      
  
(check-expect (shipping-fee 50000) 0)
(check-expect (shipping-fee 49999) 3000)


;; free-shipping? : Number -> Boolean
;; дүн 50000 ба түүнээс их бол #t. if ашиглахгүйгээр бич.
(define (free-shipping? number)
  (>= number 50000))
  
                           

(check-expect (free-shipping? 50000) #t)
(check-expect (free-shipping? 49999) #f)
;larger : Number Number -> Number
;; хоёр тооны их нь
(define (larger a b)
  (if (> a b)
      a
      b))
(check-expect (larger 3 8) 8)
(check-expect (larger 8 3) 8)
(check-expect (larger 5 5) 5)
;; absolute-value : Number -> Number
;; сөрөг бол эсрэг тэмдэгтэй болгоно, үгүй бол хэвээр
(define (absolute-value a)
  (if (< a 0)
      (- 0 a)
      a))
     
      
  
(check-expect (absolute-value -4) 4)
(check-expect (absolute-value 4) 4)
(check-expect (absolute-value 0) 0)

(define (scholarship-label score attendance)
  (if (scholarship? score attendance) "scholarship" "regular"))
(check-expect (scholarship-label 95 85) "scholarship")
(check-expect (scholarship-label 90 80) "scholarship")
(check-expect (scholarship-label 89 80) "regular")
(check-expect (scholarship-label 90 79) "regular")







;; COND ELSE
;; grade : Number -> String
;; 0–100 оноог үсгэн дүн болгоно
;(define (grade score)
  ;(cond
   ; [(>= score 90) "A"]
    ;[(>= score 80) "B"]
    ;[(>= score 70) "C"]
    ;[(>= score 60) "D"]
    ;[else "F"]))

;(check-expect (grade 90) "A")   ; хил
;(check-expect (grade 89) "B")   ; хилийн доор






; temperature-label : Number -> String
;; 0-ээс бага "freezing", 0–14 "cold", 15–24 "warm", 25 ба түүнээс дээш "hot"
(define (temperature-label temperature)
  (cond
    [(<= temperature -1) "freezing"]
    [(<= temperature 0) "cold"]
    [(<= temperature 14) "cold"]
    [(<= temperature 24) "warm"]
    [else "hot"]))
;; ticket-price : Number -> Number
;; age 13-аас бага 5000, 13–59 10000, 60 ба түүнээс дээш 6000
;(define (ticket-price a)
  ;(cond
    ;[(< a 13) "5000"]
    ;[(>= a 13) "10000"]
    ;[(<= a 59) "10000"]
    ;[(>= a 60) "6000"]
    
    
                      
;(check-expect (ticket-price 12) 5000)
;(check-expect (ticket-price 13) 10000)
;(check-expect (ticket-price 59) 10000)
;(check-expect (ticket-price 60) 6000)



  
    
    

(check-expect (temperature-label -1) "freezing")
(check-expect (temperature-label 0) "cold")
(check-expect (temperature-label 14) "cold")
(check-expect (temperature-label 15) "warm")
(check-expect (temperature-label 24) "warm")
(check-expect (temperature-label 25) "hot")
;; number-sign : Number -> String
;; "positive", "zero", "negative"
(define (number-sign number)
  (cond
    [(> number 0) "positive"]
    [(= number 0) "zero"]
    [else "negative"]))

(check-expect (number-sign 5) "positive")
(check-expect (number-sign 0) "zero")
(check-expect (number-sign -5) "negative")
; file-size-label : Number -> String
;; MiB хэмжээ: 10-аас бага "small", 10–99 "medium", 100 ба түүнээс их "large"
(define (file-size-label a)
  (cond
    [(< a 10) "small"]
    [(and (>= a 10) (<= a 99)) "medium"]
    
    
    [else "large"]))

(check-expect (file-size-label 9) "small")
(check-expect (file-size-label 10) "medium")
(check-expect (file-size-label 99) "medium")
(check-expect (file-size-label 100) "large")

    
    
    






         
  
 
  