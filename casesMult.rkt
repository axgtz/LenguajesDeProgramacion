#|
Roberto Alejandro Gutierrez Guillen
09/09/2019

Use $.rkt in the repository where the file is located then use
$(load "casesMult.rkt")
to load the program and to run it use:
$(casesMult 2 2)
|#
(define (casesMult a b);Uses cases to do recursion 
  (case b
    [(0) 0]
    [(1) a]
    [else (+ a (casesMult a (- b 1)))]
  )
)