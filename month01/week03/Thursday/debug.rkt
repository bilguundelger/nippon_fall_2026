;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Ex02

;1. (list 4 5) -- (cons 4 (cons 5 empty))
;2 (list "a" "b" "c") -- (cons "a" (cons "b" (cons "c" empty)))
;3 (cons 7 (cons 8 empty)) -- (list 7 8)
;4 (list) == empty

;;3

;; add-ten-all : List-of-numbers -> List-of-numbers

(define (add-ten-all l)
  (cond
    [(empty? l) empty]
    [else
     (cons (+ (first l) 10)
           (add-ten-all (rest l)))]))

(check-expect (add-ten-all empty) empty)
(check-expect (add-ten-all (list 1 2 3)) (list 11 12 13))

;2 ;; only-positive : List-of-numbers -> List-of-numbers
;; зөвхөн эерэг тоонуудыг үлдээнэ (0 эерэг биш)

(define (only-positive lon)
  (cond
    [(empty? lon) empty]
    [(positive? (first lon))
     (cons (first lon)
           (only-positive (rest lon)))]
    [else
     (only-positive (rest lon))]))
(check-expect (only-positive empty) empty)
(check-expect (only-positive (list -2 0 5 9)) (list 5 9))

;3
;; cap-at-100 : List-of-numbers -> List-of-numbers
;; 100-аас их оноог 100 болгоно. min ашиглаж болно.

(define (cap-at-100 l)
  (cond
    [(empty? l) empty]
    [else
     (cons (min (first l) 100) (cap-at-100 (rest l)))]))
    
(check-expect (cap-at-100 (list 50 100 150)) (list 50 100 100))


;; 4

;; 1.
(define (double-all-1 l)
  (cond [(empty? l) empty]
        [else (cons (* 2 (first l)) (double-all-1 (rest l)))]))
(check-expect (double-all-1 (list 1 2)) (list 2 4))

;; 2.
(define (add-ten-all-2 l)
  (cond [(empty? l) empty]
        [else (cons (+ 10 (first l)) (add-ten-all-2 (rest l)))]))
(check-expect (add-ten-all-2 (list 1 2)) (list 11 12))

;; 3.
(define (only-positive-3 l)
  (cond [(empty? l) empty]
        [else (if (positive? (first l))
                  (cons (first l) (only-positive-3 (rest l)))
                  (only-positive-3 (rest l)))]))
                  
(check-expect (only-positive-3 (list -1 5)) (list 5))
       
              
                  
                  


;; 4.


(define (only-positive-4 l)
  (cond
    [(empty? l) empty]
    [else
     (if (positive? (first l))
         (cons (first l)
               (only-positive-4 (rest l)))
         (only-positive-4 (rest l)))]))

(check-expect (only-positive-4 (list -1 5)) (list 5))
(check-expect (only-positive-4 (list -2 0 5 9)) (list 5 9))
(check-expect (only-positive-4 empty) empty)

        
                 
;; 5.
(define (cap-at-100-5 l)
  (cond [(empty? l) empty]
        [else (cons (min (first l) 100) (cap-at-100-5 (rest l)))]))
(check-expect (cap-at-100-5 (list 50 150)) (list 50 100))
