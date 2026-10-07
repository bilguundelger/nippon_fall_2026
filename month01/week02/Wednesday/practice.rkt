;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; bonus-points : Number -> Number
;; оноо 90 ба түүнээс дээш бол 5 нэмэлт оноо, үгүй бол 0
(define (bonus-points score)
  (if (>= score 90)
      5
      0))
(check-expect (bonus-points 90) 5)
(check-expect (bonus-points 89) 0)
;; exam-time? : Number -> Boolean
(define (exam-time? hour)
  (and (>= hour 9)
       (<= hour 12)))
(check-expect (exam-time? 9) #t)
(check-expect (exam-time? 12) #t)
(check-expect (exam-time? 8) #f)
(check-expect (exam-time? 13) #f)
;; water-state : Number -> String
;; 0-ээс бага "ice", 0–99 "water", 100 ба түүнээс дээш "steam"
(define (water-state temperature)
  (cond
    [(< temperature 0) "ice"]
    [(< temperature 100) "water"]
    [else "steam"]))

(check-expect (water-state -1) "ice")
(check-expect (water-state 0) "water")
(check-expect (water-state 99) "water")
(check-expect (water-state 100) "steam")

;; minutes-to-seconds : Number -> Number
(define (minutes-to-seconds minutes)
  (* minutes 60))
(check-expect (minutes-to-seconds 2) 120)

;; hours-to-seconds : Number -> Number
;; minutes-to-seconds-г дуудна (1 цаг = 60 минут)
(define (hours-to-seconds hours)
  (minutes-to-seconds (* hours 60)))
(check-expect (hours-to-seconds 1) 3600)
(check-expect (hours-to-seconds 2) 7200)

;; mib-to-bits : Number -> Number
;; 1 MiB = 1024 KiB. Даваагийн kib-to-bits-г дуудна.
(define (mib-to-bits mib)
  (kib-to-bits (* mib 1024)))
(define (kib-to-bits kib)
  (* kib 8192))
(check-expect (mib-to-bits 1) 8388608)
;; fahrenheit-to-celsius : Number -> Number
(define (fahrenheit-to-celsius fahrenheit)
  (* (- fahrenheit 32) (/ 5 9)))
;; C = (F - 32) × 5/9
(check-expect (fahrenheit-to-celsius 212) 100)
(check-expect (fahrenheit-to-celsius 32) 0)

;; fahrenheit-to-kelvin : Number -> Number
;; K = C + 273.15. fahrenheit-to-celsius-г дуудна.
(define (fahrenheit-to-kelvin fahrenheit)
  (+ (fahrenheit-to-celsius fahrenheit) 273.15))

(check-expect (fahrenheit-to-kelvin 32) 273.15)
;; tax-amount : Number Number -> Number
;; нийт үнэ ба татварын хувь (10 = 10%) → татварын хэмжээ
(define (tax-amount total tax-rate)
  (* total (/ tax-rate 100)))

(check-expect (tax-amount 3000 10) 300)

;; price-with-tax : Number Number Number -> Number
;; нэгж үнэ, тоо ширхэг, хувь → татвартай нийт үнэ.
;; Даваагийн item-total ба tax-amount-г дуудна.
(define (price-with-tax price quantity tax-rate)
  (+ (item-total price quantity)
     (tax-amount (item-total price quantity) tax-rate)))
(define (item-total price quantity)
  (* price quantity))

(check-expect (price-with-tax 1000 3 10) 3300)
(check-expect (price-with-tax 1000 3 0) 3000)
;Ex04
;; valid-percent? : Number -> Boolean
;; 0-ээс 100 хүртэл (хоёр талдаа орно) бол #t
(define (valid-percent? percent)
  (and (>= percent 0)
       (<= percent 100)))
(check-expect (valid-percent? 0) #t)
(check-expect (valid-percent? 100) #t)
(check-expect (valid-percent? -1) #f)
(check-expect (valid-percent? 101) #f)
;; weekday? : Number -> Boolean
;; өдрийн дугаар (1 = Даваа ... 7 = Ням) 1–5 бол #t
(define (weekday? day)
  (and (>= day 1)
       (<= day 5)))
(check-expect (weekday? 1) #t)
(check-expect (weekday? 5) #t)
(check-expect (weekday? 6) #f)
;; eligible-basic? : Number Number -> Boolean
;; score 60 ба түүнээс дээш, attendance 80 ба түүнээс дээш бол #t
(define (eligible-basic? score attendance)
  (and (>= score 60)
       (>= attendance 80)))

;; needs-help? : Number Number -> Boolean
;; eligible-basic? биш бол #t. not ба eligible-basic?-г ашигла.
(define (needs-help? score attendance)
  (not (eligible-basic? score attendance)))
(check-expect (needs-help? 59 100) #t)
(check-expect (needs-help? 60 80) #f)

(check-expect (eligible-basic? 60 80) #t)
(check-expect (eligible-basic? 59 100) #f)
(check-expect (eligible-basic? 100 79) #f)
;Ex05
;; parking-fee : Number -> Number
;; 2 цаг хүртэл (2 орно) үнэгүй, түүнээс их бол 2000
(define (parking-fee hours)
  (if (<= hours 2)
      0
      2000))
(check-expect (parking-fee 2) 0)
(check-expect (parking-fee 3) 2000)

;; smaller : Number Number -> Number
;; хоёр тооны бага нь
(define (smaller a b)
  (if (< a b)
      a
      b))
(check-expect (smaller 3 8) 3)
(check-expect (smaller 8 3) 3)
(check-expect (smaller 5 5) 5)

;; speed-label : Number -> String
;; км/ц: 30-аас бага "slow", 30–59 "normal", 60–99 "fast", 100 ба түүнээс дээш "too fast"
(define (speed-label speed)
  (cond
    [(< speed 30) "slow"]
    [(< speed 60) "normal"]
    [(< speed 100) "fast"]
    [else "too fast"]))

(check-expect (speed-label 29) "slow")
(check-expect (speed-label 30) "normal")
(check-expect (speed-label 59) "normal")
(check-expect (speed-label 60) "fast")
(check-expect (speed-label 99) "fast")
(check-expect (speed-label 100) "too fast")

;; battery-label : Number -> String
;; 0–100%: 10 хүртэл "empty", 11–50 "low", 51–99 "ok", 100 "full"
(define (battery-label percent)
  (cond
    [(<= percent 10) "empty"]
    [(<= percent 50) "low"]
    [(<= percent 99) "ok"]
    [else "full"]))
(check-expect (battery-label 10) "empty")
(check-expect (battery-label 11) "low")
(check-expect (battery-label 50) "low")
(check-expect (battery-label 51) "ok")
(check-expect (battery-label 99) "ok")
(check-expect (battery-label 100) "full")

;; report-status : Number Number -> String
;; score, attendance:
;;   eligible-basic? үнэн бол         "pass"
;;   score >= 60 боловч ирц хүрэхгүй   "attendance"
;;   бусад                            "retake"
(define (report-status score attendance)
  (cond
    [(eligible-basic? score attendance) "pass"]
    [(>= score 60) "attendance"]
    [else "retake"]))
<<<<<<< HEAD
(check-expect (report-status 60 80) "pass")  
=======

 
>>>>>>> 0a1e7e5 (practice.rkt)
(check-expect (report-status 70 50) "attendance")
(check-expect (report-status 40 90) "retake")


