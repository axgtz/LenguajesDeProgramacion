#|
Temperature Converter
Roberto Alejandro Gutierrez Guillen
2/08/2019
|#

(define (converterFC tempNum)
  (* (- tempNum 32.0) (/ 5.0 9.0) )
)

(define (converterCF tempNum)
  (+ 32 (* tempNum (/ 9.0 5.0)))
)