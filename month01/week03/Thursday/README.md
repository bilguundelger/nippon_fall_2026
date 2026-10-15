### Trace: `passing-scores`

```racket
(passing-scores (list 40 60 72 58 100))
= (passing-scores (list 60 72 58 100)) ; 40 < 60, алгасана
= (cons 60 (passing-scores (list 72 58 100))) ; 60 >= 60
= (cons 60 (cons 72 (passing-scores (list 58 100)))) ; 72 >= 60
= (cons 60 (cons 72 (passing-scores (list 100)))) ; 58 < 60
= (cons 60 (cons 72 (cons 100 (passing-scores empty)))) ; 100 >= 60
= (cons 60 (cons 72 (cons 100 empty)))
= (list 60 72 100)
```

**Тайлбар:** `passing-scores` функц нь 60-аас бага оноонуудыг хасаж, 60 болон түүнээс дээш оноонуудыг анхны дарааллаар хадгалдаг.
