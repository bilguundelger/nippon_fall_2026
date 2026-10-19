;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; List


;; хоосон list
(define no-scores empty)

no-scores

;; 1 элементтэй list: 70, дараа нь хоосон
(define one-score (cons 70 empty))
one-score

;; 3 элементтэй list: 70, 82, 95
(define scores (cons 70 (cons 82 (cons 95 empty))))
scores
(first scores)
(rest scores)
(first (rest scores))
(empty? scores)
(cons? scores)


; Exercises
(define temperatures (cons 18 (cons 19 (cons 20 (cons 21 empty)))))

(check-expect (first temperatures) 18)

(check-expect (first (rest (rest temperatures))) 20)

(define numbers
  (cons 12
        (cons 24
              (cons 36
                    (cons 48 empty)))))

(check-expect (first numbers) 12)
(check-expect (first (rest numbers)) 24)
(check-expect (first (rest (rest numbers))) 36)
(check-expect (rest numbers) (cons 24
                                   (cons 36
                                         (cons 48 empty))))
(check-expect (empty? numbers) #f)
(check-expect (cons? numbers) #t)

(define subjects
  (cons "Math" (cons "Physics" (cons "Programming" (cons "English" empty)))))
                      
(define (second-subject list)
  (first (rest list)))
  

   
(check-expect
 (second-subject
  (cons "Math" (cons "Physics" empty)))
 "Physics")

(check-expect
 (second-subject
  (cons "A" (cons "B" (cons "C" empty)))) "B")
;Ex04
;List yg 2 elementtei eseh
;exactly-two? list-of-numbers - boolean
; list yg 2 elementtei bol true butsaana.

(define (exactly-two? numbers)
  (and
   (cons? numbers)
   (cons? (rest numbers))
   (empty? (rest (rest numbers)))))
        

(check-expect (exactly-two? empty) #false)
(check-expect
 (exactly-two? (cons 5 empty))
 #false)
(check-expect
 (exactly-two? (cons 5 (cons 10 empty)))
 #true)
(check-expect
 (exactly-two? (cons 5 (cons 10 (cons 15 empty))))
 #false)

;Ex05

(define prices
  (cons 2500
        (cons 4000
              (cons 1500 empty))))
(define (first-three-total prices)
  (+ (first prices)
     (first (rest prices))
     (first (rest (rest prices)))))
            

(check-expect (first-three-total prices) 8000)

 (check-expect
  (first-three-total (cons 100 (cons 200 (cons 300 empty))))
 600)

;; 100 elements prices?

;; recursive function


                   

 
                                    



