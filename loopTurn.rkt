#|
Roberto Alejandro Gutierrez Guillen
09/09/2019
Funcion que recive una lista y la invierte
|#
(define (loopTurn lst)
    (if (= 1 (length lst)); until list has one
        (list (first lst)); return last element
        (append 
            (loopTurn (cdr lst)) 
            (list (first lst)) 
        )
    )
)
