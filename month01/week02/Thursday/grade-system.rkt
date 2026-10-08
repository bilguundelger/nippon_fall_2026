;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname grade-system) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; sum3 : Number Number Number -> Number
(define (sum3 a b c)
  (+ a b c))
(check-expect (sum3 80 90 70) 240)

;; average3 : Number Number Number -> Number
;; гурван тооны дундаж. sum3-г дуудна.
(define (average3 a b c)
  (/ (+ a b c) 3))
(check-expect (average3 80 90 70) 80)
(check-expect (average3 60 60 60) 60)

;; assignment-percent : Number Number -> Number
;; хийсэн ба нийт даалгавар → гүйцэтгэлийн хувь (total > 0)
(define (assignment-percent a b)
  (* a b))
(check-expect (assignment-percent 8 10) 80)
(check-expect (assignment-percent 7 10) 70)
(check-expect (assignment-percent 0 10) 0)

;; passing-average? : Number Number Number -> Boolean
;; average3 60 ба түүнээс дээш бол #t
(define (passing-average? a b c)
  (>= (average3 a b c) 60))
(check-expect (passing-average? 60 60 60) #t)
(check-expect (passing-average? 59 59 59) #f)
(check-expect (passing-average? 100 80 0) #t)   ; дундаж яг 60

;; good-attendance? : Number -> Boolean
;; ирц 80 ба түүнээс дээш бол #t

(define (good-attendance? a)
  (>= a 80))
(check-expect (good-attendance? 80) #t)
(check-expect (good-attendance? 79) #f)

;; assignments-complete? : Number Number -> Boolean
;; assignment-percent 70 ба түүнээс дээш бол #t. assignment-percent-г дуудна.

(define (assignments-complete? a b)
  (>= (assignment-percent a b) 70))
(check-expect (assignments-complete? 7 10) #t)
(check-expect (assignments-complete? 6 10) #f)
(check-expect (assignments-complete? 0 10) #f)

;; eligible? : Number Number Number Number Number Number -> Boolean
;; s1 s2 s3 attendance completed total → гурван шалгуур бүгд үнэн бол #t

  
(define (eligible? s1 s2 s3 attendance completed total)
  (and
   (passing-average? s1 s2 s3)
   (>= attendance 80)
   (assignments-complete? completed total)))
  
(check-expect (eligible? 80 90 70 85 8 10) #t)
(check-expect (eligible? 80 90 70 79 8 10) #f)   ; ирц
(check-expect (eligible? 59 59 59 100 10 10) #f) ; оноо
(check-expect (eligible? 80 90 70 85 6 10) #f)   ; даалгавар

;; final-status : Number Number Number Number Number Number -> String
;; тэнцсэн бол "Eligible", үгүй бол "Not eligible"

(define (final-status s1 s2 s3 attendance completed total)
  (if (eligible? s1 s2 s3 attendance completed total)
      "Eligible"
      "Not eligible"))
 
(check-expect (final-status 80 90 70 85 8 10) "Eligible")
(check-expect (final-status 80 90 70 79 8 10) "Not eligible")

;; letter-grade : Number -> String
;; дундаж оноо → "A" "B" "C" "D" "F" (Мягмарын grade-тэй ижил дүрэм)
(define (letter-grade n)
  (cond
    [(>= n 90) "A"]
    [(>= n 80) "B"]
    [(>= n 70) "C"]
    [(>= n 60) "D"]
    [else "F"]))
(check-expect (letter-grade 90) "A")
(check-expect (letter-grade 89) "B")
(check-expect (letter-grade 80) "B")
(check-expect (letter-grade 79) "C")
(check-expect (letter-grade 60) "D")
(check-expect (letter-grade 59) "F")

;; student-grade : Number Number Number -> String
;; гурван оноо → үсгэн дүн. average3 ба letter-grade-г дуудна.

(define (student-grade a b c)
  (letter-grade (average3 a b c)))
(check-expect (student-grade 80 90 70) "B")
(check-expect (student-grade 100 90 80) "A")

;Ex02

(require 2htdp/image)
(circle 30 "solid" "green")
(rectangle 80 40 "outline" "blue")
(text "Hello" 24 "black")
(overlay (text "A" 24 "white") (circle 30 "solid" "green"))
(beside (circle 20 "solid" "red") (circle 20 "solid" "blue"))
(above (circle 20 "solid" "red") (circle 20 "solid" "blue"))

;; grade-color : Number -> String
;; дундаж оноо → өнгө: 90+ "green", 80–89 "blue", 70–79 "gold", 60–69 "orange", бусад "red"
(define (grade-color score)
  (cond
    [(>= score 90) "green"]
    [(>= score 80) "blue"]
    [(>= score 70) "gold"]
    [(>= score 60) "orange"]
    [else "red"]))

(check-expect (grade-color 90) "green")
(check-expect (grade-color 89) "blue")
(check-expect (grade-color 60) "orange")
(check-expect (grade-color 59) "red")

;; grade-badge : Number -> Image
;; дундаж оноо → өнгөт тойрог дээр цагаан үсгэн дүн.
;; grade-color, letter-grade-г дуудна.
(require 2htdp/image)

(define (grade-badge score)
  (overlay (text (letter-grade score) 24 "white")
           (circle 30 "solid" (grade-color score))))
  
  
(check-expect (grade-badge 95) (overlay (text "A" 24 "white") (circle 30 "solid" "green")))
(check-expect (grade-badge 59) (overlay (text "F" 24 "white") (circle 30 "solid" "red")))

;; student-card : Number Number Number Number Number Number -> Image
;; s1 s2 s3 attendance completed total → тэмдэг, хажууд нь final-status-ийн текст.

;; average3, grade-badge, final-status-г дуудна.
(require 2htdp/image)

(define (student-card s1 s2 s3 attendance completed total)
  (beside (grade-badge (average3 s1 s2 s3))
          (text (final-status s1 s2 s3 attendance completed total) 20 "black")))


(check-expect (student-card 80 90 70 85 8 10)
              (beside (grade-badge 80) (text "Eligible" 20 "black")))
(student-card 80 90 70 85 8 10)

;Ex03

;Доорх бүх мөр spec-үүд дотор check-expect болж орсон байна. Бүгд давсан эсэхийг шалга, дээр нь өөрийн 3 тест нэм (жишээ нь бүх оноо 100, бүх оноо 0, ирц яг 80 ба оноо яг 60).

;Шалгах зүйл	Дуудлага	Хүлээгдэх
;Дундаж яг 60	(passing-average? 60 60 60)	#t
;Дундаж 59	(passing-average? 59 59 59)	#f
;Дүн 90 / 89	(letter-grade 90) / (letter-grade 89)	"A" / "B"
;Дүн 80 / 79	(letter-grade 80) / (letter-grade 79)	"B" / "C"
;Ирц 80 / 79	(good-attendance? 80) / (good-attendance? 79)	#t / #f
;Даалгавар 7/10 / 6/10	(assignments-complete? 7 10) / (assignments-complete? 6 10)	#t / #f
;0 даалгавар	(assignment-percent 0 10)	0
;Бүрэн тэнцсэн	(eligible? 80 90 70 85 8 10)	#t
;Ирцээр унасан	(final-status 80 90 70 79 8 10)	"Not eligible"

;; Tests

(check-expect (passing-average? 60 60 60) #t)
(check-expect (passing-average? 59 59 59) #f)

(check-expect (letter-grade 90) "A")
(check-expect (letter-grade 89) "B")

(check-expect (letter-grade 80) "B")
(check-expect (letter-grade 79) "C")

(check-expect (good-attendance? 80) #t)
(check-expect (good-attendance? 79) #f)

(check-expect (assignments-complete? 7 10) #t)
(check-expect (assignments-complete? 6 10) #f)

(check-expect (assignment-percent 0 10) 0)

(check-expect (eligible? 80 90 70 85 8 10) #t)

(check-expect (final-status 80 90 70 79 8 10)
              "Not eligible")


; Миний 3 н тест

;; Бүх оноо 100
(check-expect (student-grade 100 100 100) "A")

;; Бүх оноо 0
(check-expect (passing-average? 0 0 0) #f)

;; Ирц яг 80%, дундаж яг 60%, даалгавар 7/10
(check-expect (eligible? 60 60 60 80 7 10) #t)

;Ex04

;; honor-roll? : Number Number Number Number -> Boolean
;; s1 s2 s3 attendance:
;; дундаж 90 ба түүнээс дээш, ирц 95 ба түүнээс дээш бол #t
(define (honor-roll? s1 s2 s3 attendance)
  (and
   (>= (average3 s1 s2 s3) 90)
   (>= attendance 95)))

(check-expect (honor-roll? 90 90 90 95) #t)
(check-expect (honor-roll? 90 90 90 94) #f)
(check-expect (honor-roll? 89 89 89 100) #f)

;; ineligibility-reason : Number Number Number Number Number Number -> String
;; Хэд хэдэн шалгуур унавал эхнийхийг нь буцаана:
;; оноо → ирц → даалгавар.
;; Бүгд үнэн бол "Eligible".
(define (ineligibility-reason s1 s2 s3 attendance completed total)
  (cond
    [(not (passing-average? s1 s2 s3)) "Low score"]
    [(not (good-attendance? attendance)) "Low attendance"]
    [(not (assignments-complete? completed total)) "Missing assignments"]
    [else "Eligible"])) 

(check-expect (ineligibility-reason 59 59 59 50 0 10) "Low score")
(check-expect (ineligibility-reason 80 90 70 79 0 10) "Low attendance")
(check-expect (ineligibility-reason 80 90 70 85 6 10) "Missing assignments")
(check-expect (ineligibility-reason 80 90 70 85 8 10) "Eligible")

;; average5 : Number Number Number Number Number -> Number
;; Таван онооны дундаж
(define (average5 a b c d e)
  (/ (+ a b c d e) 5))

(check-expect (average5 60 70 80 90 100) 80)


