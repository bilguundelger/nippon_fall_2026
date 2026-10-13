;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname tuesdaylesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 100 elements prices?
;; recursive function

;;fun-for-lon : list-of-numbers
;template
;(define (fun-for-lon l)
  ;(cond
    ;[(empty? l)...]
    ;[else (... (first l)
               ;... (fun-for-lon (rest l)) ...)]))
;sum
(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (first l)
             (sum (rest l)))]))

(check-expect (sum empty) 0)
(check-expect (sum (cons 1 (cons 2 (cons 3 empty)))) 6)

;; multiply : list-of-numbers - numbers

(define (multiply l)
  (cond
    [(empty? l) 1]
    [else (* (first l)
             (multiply (rest l)))]))


(check-expect (multiply empty) 1)
(check-expect (multiply (cons 1 (cons 2 (cons 3 empty)))) 6)
(check-expect (multiply (cons 1 (cons 2 (cons 3 (cons 4 empty))))) 24)
;Ex01
(define (count-words l)
  (cond
    [(empty? l) 0]
    [else (+ 1
             (count-words (rest l)))]))

(check-expect (count-words empty) 0)
(check-expect (count-words (cons "hello" empty)) 1)
(check-expect (count-words (cons "hello" (cons "world" empty))) 2)
(check-expect (count-words (cons "I" (cons "love" (cons "Racket" empty)))) 3)

;Ex02

;;contains-word?
(define (contains-word? word words)
  (cond
    [(empty? words) #false]
    [(string=? word (first words)) #true]
    [else (contains-word? word (rest words))]))
;Haij buu ug jagsaaltad baigaa esehiig shalgana.

(check-expect (contains-word? "cat" empty) #false)
(check-expect
 (contains-word? "cat" (cons "cat" empty))
 #true)
(check-expect
 (contains-word? "dog" (cons "cat" (cons "dog" empty)))
 #true)
(check-expect
 (contains-word? "bird" (cons "cat" (cons "dog" empty)))
 #false)

;Ex03
;; count-log-words
;;5 buyu tuunees olon temdegtei usgiin toog olno.
;;string-length usgiin heden uyes burdej buig oloh.
(define (count-long-words words)
  (cond
    [(empty? words) 0]
    [(>= (string-length (first words)) 5)
     (+ 1 (count-long-words (rest words)))]
    [else
     (count-long-words (rest words))]))
(check-expect (count-long-words empty) 0)
(check-expect (count-long-words (cons "cat" empty)) 0)
(check-expect (count-long-words (cons "apple" empty)) 1)
(check-expect
 (count-long-words
  (cons "apple" (cons "hi" (cons "banana" empty))))
 2)
(check-expect
 (count-long-words
  (cons "hello" (cons "world" (cons "Racket" empty))))
 3)

;;Ex04
;; count-completed : List-of-Boolean -> Number
;; List доторх #true утгуудыг тоолно.

(define (count-completed items)
  (cond
    [(empty? items) 0]
    [(first items) (+ 1 (count-completed (rest items)))]
    [else (count-completed (rest items))]))
  
(check-expect (count-completed empty) 0)
(check-expect (count-completed (cons #true empty)) 1)
(check-expect (count-completed (cons #false empty)) 0)
(check-expect
 (count-completed (cons #true (cons #false empty)))
 1)
(check-expect
 (count-completed
  (cons #true (cons #true (cons #false (cons #true empty)))))
 3)
(check-expect
 (count-completed
  (cons #false (cons #false (cons #false empty))))
 0)

;;Ex05
;;join-words ;list of string-strings
;;buh ugiig zaigaar tusgaarlan holbono
;(string-append "Hello" "World") "HelloWorld"

(define (join-words words)
  (cond
    [(empty? words) ""]
    [(empty? (rest words)) (first words)] 
    [else
     (string-append
      (first words)
      
          ""
          (string-append " " (join-words (rest words))))]))




;; join-words : List-of-String -> String
;; Үгсийг зайгаар тусгаарлан нийлүүлнэ.

(check-expect (join-words empty) "")
(check-expect (join-words (cons "Hello" empty)) "Hello")
(check-expect
 (join-words (cons "Hello" (cons "world" empty)))
 "Hello world")
(check-expect
 (join-words (cons "I" (cons "love" (cons "Racket" empty))))
 "I love Racket")


