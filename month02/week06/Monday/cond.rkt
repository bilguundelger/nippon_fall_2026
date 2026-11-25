;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cond) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


(define (classify-age age)
  (cond
    [(and (> age 0) (<= age 13)) "baby"]
    [(and (> age 13) (<= age 19)) "teenager"]
    [(and (> age 20) (<= age 65)) "adult"]
    [(> age 65) "senior"]
    [else "invalid age"]))


(classify-age 5)   ; returns "baby"
(classify-age 15)  ; returns "teenager"
(classify-age 30)  ; returns "adult"
(classify-age 70)  ; returns "senior" 

;; 2. check-expect шалгалтууд (Test cases)
(check-expect (get-age-category 5) "baby")
(check-expect (get-age-category 12) "baby")
(check-expect (get-age-category 15) "teenager")
(check-expect (get-age-category 19) "teenager")

(check-expect (get-age-category 30) "adult")
(check-expect (get-age-category 65) "adult")

(check-expect (get-age-category 70) "senior")

;; Завсрын болон буруу утгуудын шалгалт
(check-expect (get-age-category 13) "invalid age")
(check-expect (get-age-category -5) "invalid age")