#|
    Roberto Alejandro Gutierrez Guillen
    07/11/2019
    First example using threads in Racket

    to load use (enter! "threads.rkt")
|#
#lang racket

(define (main)
    (display "Main thread starting \n")
    ;Run thread
    (thread (lambda () (display "Thread 1 \n")))
    (thread (lambda () (display "Thread 2 \n")))
    (thread (lambda () (display "Thread 3 \n")))

    (display "Main thread finishing \n")
)

#|
;function that the thread is going to execute
(define (starting)
    (display "This is the thread, Hold your breath and count to ten\n")
)

(display "Main thread\n")
(thread starting)
(display "Main finishing\n")
|#