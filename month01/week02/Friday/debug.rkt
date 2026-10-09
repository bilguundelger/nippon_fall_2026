;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;(average3 80 90 70)-80
;(assignment-percent 7 10)-70
;(passing-average? 100 80 0)- #t
;(eligible? 80 90 70 79 8 10)- #f
;(final-status 59 59 59 100 10 10)- not eligible
;(letter-grade 69)- D
;(student-grade 100 90 80)-A
;(ineligibility-reason 80 90 70 79 0 10)-Low attendance

;Ex02




(define (sum3 a b c)
  (+ a b c))

(define (average3 a b c)
  (/ (sum3 a b c) 3))

(define (assignment-percent completed total)
  (* (/ completed total) 100))

(define (passing-average? s1 s2 s3)
  (>= (average3 s1 s2 s3) 60))

(define (good-attendance? attendance)
  (>= attendance 80))

(define (assignments-complete? completed total)
  (>= (assignment-percent completed total) 70))

(define (eligible? s1 s2 s3 attendance completed total)
  (and (passing-average? s1 s2 s3)
       (good-attendance? attendance)
       (assignments-complete? completed total)))


;1

(define (assignment-percent-1 completed total)
  (* (/ completed total) 100))

(check-expect (assignment-percent-1 8 10) 80)


;2

(define (passing-average-2? s1 s2 s3)
  (>= (average3 s1 s2 s3) 60))

(check-expect (passing-average-2? 20 20 20) #f)


;3

(define (eligible-3? s1 s2 s3 attendance completed total)
  (and (passing-average? s1 s2 s3)
       (good-attendance? attendance)
       (assignments-complete? completed total)))

(check-expect (eligible-3? 80 90 70 85 6 10) #f)


;4

(define (final-status-4 s1 s2 s3 attendance completed total)
  (if (eligible? s1 s2 s3 attendance completed total)
      "Eligible"
      "Not eligible"))

(check-expect (final-status-4 80 90 70 85 8 10)
              "Eligible")


;5

(define (final-status-5 s1 s2 s3 attendance completed total)
  (if (eligible? s1 s2 s3 attendance completed total)
      "Eligible"
      "Not eligible"))

(check-expect (final-status-5 80 90 70 85 8 10)
              "Eligible")


;6

(define (ineligibility-reason-6
         s1 s2 s3 attendance completed total)
  (cond
    [(not (passing-average? s1 s2 s3)) "Low score"]
    [(not (good-attendance? attendance)) "Low attendance"]
    [(not (assignments-complete? completed total))
     "Missing assignments"]
    [else "Eligible"]))

(check-expect
 (ineligibility-reason-6 59 59 59 50 0 10)
 "Low score")


