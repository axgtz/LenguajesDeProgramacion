#|
Roberto Alejandro Gutierrez Guillen
09/09/2019

Use $.rkt in the repository where the file is located then use
$(load "loops.rkt")
to load the program and to run it use:
$(loops 2 2)
|#
(define (multiply a b)
  (if (= b 1)
   a ; True
   (+ a (multiply a (- b 1)));false
   )
  
)