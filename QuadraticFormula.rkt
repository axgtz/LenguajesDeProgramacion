#|
Roberto Alejandro Gutierrez Guillen
2/08/2019

Usar ./racket en la terminal para entrar o usar rkt. Desp cargar el programa
> (load "../LenguajesDeProgramacion/QuadraticFormula.rkt")
|#
(define (quadratic a b c)
  (if (= a 0)
      (-(/ c b) );True, special case
      (begin     ;False, begin allows to put many expressions, combines them
         (display "Answer 1: ") 
         (display 
            (/ (- (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a))
         )
         (display "\nAnswer 2: ") 
         (display 
            (/ (+ (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a))
         )
      )
  )
)