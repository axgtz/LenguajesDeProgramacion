#|
Roberto Alejandro Gutierrez Guillen
23/09/2019
https://stackoverflow.com/questions/9625663/calculating-and-printing-the-nth-prime-number#targetText=Starting%20with%20the%20simple%20approximation,n)*e(n)%20.
|#
(define (nth-prime num)
    (let loop  ([i (round (* num (+ (log num) (log (log num)))))] [num num]);According to the answer up there this math equation is a good approximation to the number 
        (cond
            [ (> num (length (prime-less-than i))) (loop (* i 2) num) ];If its less, we duplicate value times 2
            [ (< num (length (prime-less-than i))) (loop (- i 1) num) ]; If its too much we reduce by one
            [ (= num (length (prime-less-than i))) (last (prime-less-than i)) ];if the size of the list equals the number then we found it 
        )
    )
)

(define (prime-less-than num)
    (cond
        [(> 2 num) '()]
        [(= 2 num) '(2)]
        [(< 2 num) 
            (let loop ([maxNum num] [i 3] [resultList '(2)]);Start in 3 a we consider the smaller cases
                (if (>= maxNum i);Includes the number casue it can be prime
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
            (isPrime? maxNum (cdr list)); Recursive call
        )
    )
)
