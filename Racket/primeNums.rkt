#|
Roberto Alejandro Gutierrez Guillen
23/09/2019

Find the Prime Numbers less than Number sent
|#
(define (primeNums num)
    (cond
        [(> 2 num) '()]
        [(= 2 num) '(2)]
        [(< 2 num) 
            (let loop ([maxNum num] [i 3] [resultList '(2)])
                (if (>= maxNum i)
                    (if (isPrime? i resultList)
                        (loop maxNum (+ i 2) (append resultList (list i)));True, add to list 
                        (loop maxNum (+ i 2) resultList);False, go to next number thats not pair
                    );true
                    resultList;false, its done
                )
        )]
    )
)

(define (isPrime? maxNum list);Recieves a list of primes smaller than the num
    (if (empty? (cdr list))
        #t;Good, exhausted all options of prime numbers
        (if (= (modulo maxNum (first list)) 0)
            #f
            (isPrime? maxNum (cdr list))
        )
    )
)