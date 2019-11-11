#|
    Roberto Alejandro Gutierrez Guillen
    07/11/2019
    First example using threads in Racket

    to load use (enter! "threads.rkt")
    then use (main) to execute ;
|#
#lang racket

(define (main)
    (display "Main thread starting \n")
    ;Run thread
    (define counter (thread (lambda ()
                            (let loop ([n 0])
                                       (if (< n 10)
                                            (begin (printf "Iteration ~a in thread\n" n)  
                                                    (sleep 0.2)
                                                    (loop (+ n 1))
                                            )
                                            (printf "Thread commiting sepukku\n")
                                       ) 
                            )
    )))
    (thread-wait counter)
    (display "Main thread finishing \n")
)

