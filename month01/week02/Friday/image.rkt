;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; pass-fail-badge : Number -> Image
;; оноо 60 ба түүнээс дээш бол ногоон тойрог, үгүй бол улаан (радиус 20)

(define (pass-fail-badge score)
  (if (>= score 60)
      (circle 20 "solid" "green")
      (circle 20 "solid" "red")))

  
  
(check-expect (pass-fail-badge 60) (circle 20 "solid" "green"))
(check-expect (pass-fail-badge 60) (circle 20 "solid" "green"))
(pass-fail-badge 60) (circle 20 "solid" "green")
(pass-fail-badge 60) (circle 20 "solid" "green")

;; score-bar : Number -> Image
;; оноо → өргөн нь оноотой тэнцүү, өндөр 20 цэнхэр тэгш өнцөгт
(define (score-bar score)
  (rectangle score 20 "solid" "blue"))

(check-expect (score-bar 80) (rectangle 80 20 "solid" "blue"))
(check-expect (score-bar 0) (rectangle 0 20 "solid" "blue"))
(score-bar 80) (rectangle 80 20 "solid" "blue")
(score-bar 0) (rectangle 0 20 "solid" "blue")

;; three-bars : Number Number Number -> Image
;; гурван оноог дээрээс доош баганан диаграм болгоно. score-bar-г дуудна.
(define (three-bars s1 s2 s3)
  (above
   (score-bar s1)
   (score-bar s2)
   (score-bar s3)))
  
(check-expect (three-bars 80 60 90)
              (above (score-bar 80) (score-bar 60) (score-bar 90)))
(three-bars 80 60 90)
              (above (score-bar 80) (score-bar 60) (score-bar 90))
