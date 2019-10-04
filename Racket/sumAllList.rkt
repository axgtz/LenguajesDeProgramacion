#|
Roberto Alejandro Gutierrez Guillen
09/09/2019

Use $.rkt in the repository where the file is located then use
$(load "sumAllList.rkt")
to load the program and to run it use:
$(sumAllList 2 2)
|#
(define (sumAllList list);Uses cases to do recursion 
  (if (empty? list)
   0; True
   (+ (car list) (sumAllList (cdr list)));false
   )
)