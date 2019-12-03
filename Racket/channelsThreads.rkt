#|
    Roberto Alejandro Gutierrez Guillen
    07/11/2019
    First example using threads in Racket

    use rkt
    to load use (enter! "threads3.rkt")
    then use (main) to execute ;
|#
#lang racket
(require racket/async-channel)
 
(define print-thread
  (thread (lambda ()
            (let loop ()
              (displayln (thread-receive))
              (loop)))))
(define (safer-printf . items)
  (thread-send print-thread
               (apply format items)))
 
(define work-channel (make-async-channel 3))
(define (make-worker-thread thread-id)
  (thread
   (lambda ()
     (let loop ()
       (define item (async-channel-get work-channel))
       (safer-printf "Thread ~a processing item: ~a" thread-id item)
       (loop)))))
 
(for-each make-worker-thread '(1 2 3 4 5 6))
(for ([item '(a b c d e f g h i j k l m)])
  (async-channel-put work-channel item))