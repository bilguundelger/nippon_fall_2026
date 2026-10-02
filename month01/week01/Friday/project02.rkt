;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname project02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Функцийн нэр:fuel-needed
 ; Оролт:distance fuel-efficiency
 ; Гаралт:needed
 ; Томьёо:distance/fuel-efficiency
  
(define (fuel-needed distance fuel-efficiency)
  (/ distance fuel-efficiency))
(define (fuel-cost fuel-needed price-per-liter)
  ; Функцийн нэр:fuel-cost 
 ; Оролт:fuel-needed price-per-liter 
 ; Гаралт:cost
 ; Томьёо:fuel-need x price-per-liter
  (* fuel-needed price-per-liter))
; Функцийн нэр:distance-per-day
 ; Оролт:total-distance total-days 
 ; Гаралт:day
 ; Томьёо:total-distance/total-days
(define (distance-per-day total-distance total-days)
  (/ total-distance total-days))
; Функцийн нэр:average-speed
 ; Оролт:total-distance total-time 
 ; Гаралт:speed
 ; Томьёо:total-distance/total-time
(define (average-speed total-distance total-time)
  (/ total-distance total-time))
; Функцийн нэр:total-distance
 ; Оролт:distance1 distance2 
 ; Гаралт:distance
 ; Томьёо:distance1+distance2
(define (total-distance distance1 distance2)
  (+ distance1 distance2))

(fuel-needed 1000 100)
(fuel-cost 3000 300)
(distance-per-day 1000 20)
(average-speed 1000 24)
(total-distance 1241 123124)

  