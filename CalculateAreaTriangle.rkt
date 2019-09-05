#|
Temperature Converter
Roberto Alejandro Gutierrez Guillen
2/08/2019
|#

(define (sides a b c)
  (/ (+ a b c)2.0)
)

(define (calcArea a b c)
  (sqrt
   (* (sides a b c) (- (sides a b c) a) (- (sides a b c) b) (- (sides a b c) c) )
   )
)
