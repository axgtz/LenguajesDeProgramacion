#|
Roberto Alejandro Gutierrez Guillen
23/09/2019

Find the Prime Numbers less than Number sent
|#
(define (primeLess num)
    (cond
        [(> 2 num) (printf "No prime numbers below this threshold")]; num less than two
        [(= 2 num) '(2)]
        [(< 2 num) 
            (let loop ([maxNum num] [i 3] [result '(2)])
                (if (< maxNum i)
                    (if (isPrime? maxNum '() result)
                        ();True
                        ();False
                    )
                )
        )]
    )
)

(define (isPrime? maxNum list listResult)
    (if (empty? (cdr list))
        (append listResult maxNum);Good, exhausted all options of prime numbers
        (if (= (module maxNum (first list)) 0)
            (append list listResult)
            (isPrime? maxNum (cdr list) (append listResult (cdr list)))
        )
    )
)
#|
(define (isPrime? maxNum list listResult)
    (if (empty? (cdr list))
        (append listResult maxNum);Good, exhausted all options of prime numbers
        (if (= (module maxNum (first list)) 0)
            (append list listResult)
            (isPrime? maxNum (cdr list) (append listResult (cdr list)))
        )
    )
)|#