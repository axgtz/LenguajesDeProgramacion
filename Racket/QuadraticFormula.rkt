#|
Roberto Alejandro Gutierrez Guillen
04/09/2019

Use $.rkt in the repository where the file is located then use
$(load "QuadraticFormula.rkt")
to load the program and to run it use:
$(quadratic 2 -4 -5)
|#
(define (quadratic a b c)
  (if (= a 0)
;True, special case, if a = 0
      (-(/ c b) )
;False. "begin" allows to put many expressions, combines them
      (begin 
         (display "\nRoots \n\t")
;Add the items on the list, in this case the 2 possible solutions
         (list
           (/ (+ (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a))
           (/ (- (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a))
         )
      )
  )
)

