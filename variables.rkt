#|
Roberto Alejandro Gutierrez Guillen
08/09/2019

Use $.rkt in the repository where the file is located then use
$(load "next_day.rkt")
to load the program and to run it use:
$(next_day 1 1 1996)
|#
(let*         ; si agregas el * puedes utilizar otra variables dentro de la declaracion de variables
  ;Declare variable
  ([b 4]
   [a 5]
   [c (+ a b)]
   )
  ;Expression where the variables are used
  ;1 way (* c a b)
  (printf "La multiplicacion de ~a ~a ~a es ~a" a b c (* c a b))
)