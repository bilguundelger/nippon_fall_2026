;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Wrong version ;;

;; 1
(define (count-passing l)
  (cond [(empty? l) 0]
        [else (if (passing? l)
                  (+ 1 (count-passing (rest l)))
                  (count-passing (rest l)))]))
(check-expect (count-passing students) 3)

;; 2
(define (names l)
  (cond [(empty? l) 0]
        [else (cons (student-name (first l)) (names (rest l)))]))
(check-expect (names (list aki)) (list "Aki"))

;; 3
(define (passing-students l)
  (cond [(empty? l) empty]
        [else (if (passing? (first l))
                  (cons (first l) (passing-students (rest l)))
                  l)]))
(check-expect (passing-students (list ren aki)) (list aki))

;; 4
(define (best-student l)
  (cond [(empty? l) (first l)]
        [else (better-student (first l) (best-student (rest l)))]))
(check-expect (best-student students) mina)

;; 5
(define (grades l)
  (cond [(empty? l) empty]
        [else (cons (student-grade (first l)) (rest l))]))
(check-expect (grades (list aki sora)) (list "B" "D"))

;; Fixed version ;;

;; 1

(define (count-passing l)
  (cond [(empty? l) 0]
        [else (if (passing? (first l)
                  (+ 1 (count-passing (rest l)))
                  (count-passing (rest l)))]))
(check-expect (count-passing students) 3)

;; 2
(define (names l)
  (cond [(empty? l) empty]
        [else (cons (student-name (first l)) (names (rest l)))]))
(check-expect (names (list aki)) (list "Aki"))

;; 3
(define (passing-students l)
  (cond [(empty? l) empty]
        [else (if (passing? (first l))
                  (cons (first l) (passing-students (rest l))))]))
                 
(check-expect (passing-students (list ren aki)) (list aki))

;; 4

(define (best-student l)
  (cond [(empty? l) (rest l)]
        [else (better-student (first l) (best-student (rest l)))]))
(check-expect (best-student students) mina)

;; 5
(define (grades l)
  (cond [(empty? l) empty]
        [else (cons (student-grade (first l))
                    (grades (rest l)))]))
(check-expect (grades (list aki sora)) (list "B" "D"))

