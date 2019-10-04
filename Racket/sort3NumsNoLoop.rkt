#|
Roberto Alejandro Gutierrez Guillen
05/09/2019

Sorts 3 numbers without a loop
|#
(define (sort3 a b c)
  (cond
    [(and (>= a b) (>= a c) (>= b c)) (list a b c)] ;a is bigger, then b ;Condition and action
    [(and (>= a b) (>= a c) (>= c b)) (list a c b)] ;a is bigger, then c
    [(and (>= b a) (>= b c) (>= a c)) (list b a c)] ;b is bigger, then a
  )
)

