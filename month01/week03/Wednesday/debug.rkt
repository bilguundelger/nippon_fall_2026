;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;1

;1.p ← 1; for i from 1 to 4: p ← p × i. Эцсийн p? (Үржих хуримтлагч яагаад 1-ээс эхэлдэг вэ?)
;2.c ← 0; for i from 1 to 20: if i mod 4 = 0 then c ← c + 1. c?
;3.x ← 100; c ← 0; while x > 1: x ← x ÷ 2 (бүхэл хуваах); c ← c + 1. c?
;4.i ← 0; while i < 5: i ← i + 1 хэдэн удаа? while i ≤ 5 бол?
;5.L5-ийн гэрийн даалгавар: 1 + 3 + ... + (2N - 1), N = 5 дээр trace хий.

24 (1 → 1 → 2 → 6 → 24). 0-ees ehelvel urjver 0 bolno.
5 (4, 8, 12, 16, 20).
6 (100 → 50 → 25 → 12 → 6 → 3 → 1).
5 udaa ≤ бол 6 udaa.
25 (1, 4, 9, 16, 25).

;; 2

;; Мягмарын sum, count-items-ийг энэ файлд бас хуул.

;; 1. Base case-ийн утга буруу
(define (contains-1? target l)
  (cond [(empty? l) #t]
        [else (or (= (first l) target) (contains-1? target (rest l)))]))
(check-expect (contains-1? 4 (cons 3 empty)) #f)

;; 2. Хил буруу: тэнцүүг тоолж байна
(define (count-greater-than-2 l limit)
  (cond [(empty? l) 0]
        [(>= (first l) limit) (+ 1 (count-greater-than-2 (rest l) limit))]
        [else (count-greater-than-2 (rest l) limit)]))
(check-expect (count-greater-than-2 (cons 5 empty) 5) 0)

;; 3. NEList-ийг хоосон list шиг бичсэн
(define (find-max-3 l)
  (cond [(empty? l) 0]
        [else (max (first l) (find-max-3 (rest l)))]))
(check-expect (find-max-3 (cons -5 (cons -2 empty))) -2)

;; 4. Эхний элементийг алгассан
(define (average-4 l)
  (/ (sum (rest l)) (count-items l)))
(check-expect (average-4 (cons 60 (cons 80 empty))) 70)

;; 5. Буруу зургийн function
(define (stack-all-5 imgs)
  (cond [(empty? imgs) empty-image]
        [else (beside (first imgs) (stack-all-5 (rest imgs)))]))
(check-expect (stack-all-5 (cons (circle 10 "solid" "red") (cons (circle 10 "solid" "blue") empty)))
              (above (circle 10 "solid" "red") (circle 10 "solid" "blue")))
;; Correct

;; 1. contains-1?
(define (contains-1? target l)
  (cond
    [(empty? l) #f]
    [else
     (or (= (first l) target)
         (contains-1? target (rest l)))]))

;; 2. count-greater-than-2
(define (count-greater-than-2 l limit)
  (cond
    [(empty? l) 0]
    [(> (first l) limit)
     (+ 1 (count-greater-than-2 (rest l) limit))]
    [else
     (count-greater-than-2 (rest l) limit)]))

;; 3. find-max-3
(define (find-max-3 l)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (max (first l) (find-max-3 (rest l)))]))

;; 4. average-4
(define (average-4 l)
  (/ (sum l) (count-items l)))

;; 5. stack-all-5
(define (stack-all-5 imgs)
  (cond
    [(empty? imgs) empty-image]
    [else
     (above (first imgs)
            (stack-all-5 (rest imgs)))]))