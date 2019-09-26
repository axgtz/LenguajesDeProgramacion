#|
Roberto Alejandro Gutierrez Guillen
23/09/2019

Find the Prime Numbers less than Number sent
|#
(define (primeNums num)
    (cond
        [(> 2 num) (printf "No prime numbers below this threshold")]
        [(= 2 num) '(2)]
        [(= 3 num) '(2 3)]
        [(< 2 num) 
            (let loop ([maxNum num] [i 3] [result '(2)])
                (if (< (sqrt maxNum) i)
                    (if (isPrime? maxNum result)
                        (loop maxNum (+ i 2) (append result i));True, add to list 
                        (loop maxNum (+ i 2) result);False, go to next number thats not pair
                    );true
                    result;false, its done
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