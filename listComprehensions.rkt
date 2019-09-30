#|
Roberto Alejandro Gutierrez Guillen
30/09/2019

List Comprehension
|#
;Classic way to compute the square of each element in data
(define (squares data)
    (let loop
        ( [lst data] [results empty])
        (if (empty? lst)
            results
            (loop (cdr lst) (append results (list (* (car lst) (car lst)))))
        )
    )
)

;Using map and lambda functions
(define (squares-map data)
    (map (lambda (x) (* x x)) data)
)

;Using list comprehensions
(define (squares-for data)
    ;for i in data:
    (for/list ([i data]
        ; De la lista de data solo voy a hacer cosas con la siguiente condicion
        #:when (= (remainder i 2) 0)) ; #: es como un modificador a los datos anteriores
        (* i i)
    )
)

;ITerates through 2 list, finishes when first list is over
(define (parallel names)
    (for/list
        ([name names] [num (in-range 10)])
        (string-append (number->string num) " : Super-" name)
    )
)