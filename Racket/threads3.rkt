#|
    Roberto Alejandro Gutierrez Guillen
    07/11/2019
    First example using threads in Racket

    use rkt
    to load use (enter! "threads3.rkt")
    then use (main) to execute ;
|#
#lang racket
(define semaphore-out (make-semaphore 1))

(define (make-thread name)
    (thread (lambda ()
                (let loop
                    ([n 0])
                    (if (< n 10)
                        ;true
                        (begin
                            (sleep(random));random gives back a float between 0 and 1
                            (semaphore-wait semaphore-out)
                            (printf "Thread: ~a | Counter: ~a\n" name n)
                            (semaphore-post semaphore-out)
                            (loop (+ n 1))
                        )
                        ;false
                        (printf "Thread ~a finishing\n" name)
                    )
                )
    ))
)

(define (main)
    (display "Main thread starting \n")
    (define threads (map make-thread '(Thread_A Thread_B Thread_C)))
        ;Apply funciton to each element in a list, without results
    (for-each thread-wait threads)
    (display "Main thread finishing \n")
    
)
