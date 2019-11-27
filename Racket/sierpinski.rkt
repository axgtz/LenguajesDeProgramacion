#lang racket
(require 2htdp/image)
(define (sierpinski-carpet n)
    (cond
      [(zero? n) (square 1 "solid" "black")]
      [else
       (local [(define c (sierpinski-carpet (- n 1)))
               (define i (square (image-width c) "solid" "white"))]
         (above (beside c c c)
                (beside c i c)
                (beside c c c)))]))
