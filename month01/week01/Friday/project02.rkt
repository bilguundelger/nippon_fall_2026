;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname project02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (travel-time distance speed)
  (/ distance speed))
(define (fuel-needed distance fuel-efficiency)
  (/ distance fuel-efficiency))
(define (fuel-cost fuel-needed price-per-liter)
  (* fuel-needed price-per-liter))
(define (distance-per-day total-distance total-days)
  (/ total-distance total-days))
(define (average-speed total-distance total-time)
  (/ total-distance total-time))
(define (total-distance distance1 distance2)
  (+ distance1 distance2))
(travel-time 500 10)
(fuel-needed 1000 100)
(fuel-cost 3000 300)
(distance-per-day 1000 20)
(average-speed 1000 24)
(total-distance 1241 123124)

  