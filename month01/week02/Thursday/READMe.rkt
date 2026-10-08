;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname READMe) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Тэнцсэн
;(eligible? 80 90 70 85 8 10)

; (passing-average? 80 90 70)    → average3 = 80 → #t
; (good-attendance? 85)          → #t
; (assignments-complete? 8 10)   → assignment-percent = 80 → #t
; (and #t #t #t)
; → #t
;Тэнцээгүй
;eligible? 80 90 70 79 8 10)
; (passing-average? 80 90 70)    → #t
; (good-attendance? 79)          → #f
; and нэг #f олмогц зогсоно, assignments-complete? бодогдохгүй
; → #f
;5. Жишээ trace
;Тэнцсэн


;eligible? 90 80 70 85 7 10)
; (passing-average? 90 80 70) → average3 = 80 → #t
; (good-attendance? 85) → #t
; (assignments-complete? 7 10) → assignment-percent = 70 → #t
; (and #t #t #t)
; → #t
```

;Тэнцээгүй


; (eligible? 60 70 80 90 5 10)
; (passing-average? 60 70 80) → average3 = 70 → #t
; (good-attendance? 90) → #t
; (assignments-complete? 5 10) → assignment-percent = 50 → #f
; (and #t #t #f)
; → #f
```
