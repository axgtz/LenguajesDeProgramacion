#|
Roberto Alejandro Gutierrez Guillen
04/09/2019

Tells if the student passed
|#
(define (average a b c)
  (if (or (< 70 (/ (+ a b c) 3)) (= 70 (/ (+ a b c) 3)))
      (display "Aprobado")
      (display "Reprobado")
  )
)

