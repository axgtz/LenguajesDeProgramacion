#|
    Christian Aguilar Piña
    Roberto Alejandro Gutierrez Guillen
    02/12/2019
    Project - Game of Life

    use rkt
    to load use (enter! "gameOfLife.rkt")
    then use (main) to execute ;
|#
#lang racket
(require racket/draw)

(define (main)
(+ 2 2)
    ; For iterations
      ; Run snapshot
      ; Save new snapshot
      ; Replace old snapshot with new
    
)

; Run 1 snapshot  - 1 iteration
(define (snapshot ogBitmap newBitmap)
(+ 2 2)
  ; Height For - Goes through each row
    ; Width For - Goes through each column in a row
      ; Count neighbours
      ; Switch case if alive or dead
        #| Dead cell
            Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
        |#

          #| Alive Cell
          Any live cell with fewer than two and more than three live neighbours dies
          Any live cell with two or three live neighbours lives on to the next generation.
          |#

        ; Excuse me wtf cell
)



; Count number of neighbours 
(define (countNeighbours ogBitmap)
(+ 2 2)
)


; ----- Bitmap helper functions -----

; Copy bitmap to other bitmap 

; Read ppm file ppm->bitmap 
(define (read-ppm output-port)
  (parameterize ([current-input-port output-port])
    (define magic (read))
    (define width (read))
    (define height (read))
    (define maxcol (read))
    (define bm (make-object bitmap% width height))
    (define dc (new bitmap-dc% [bitmap bm]))
    (send dc set-smoothing 'unsmoothed)
    (define (adjust v) (* 255 (/ v maxcol)))
    (for/list ([x width])
      (for/list ([y height])
        (define red (read))
        (define green (read))
        (define blue (read))
        (define color (make-object color% (adjust red) (adjust green) (adjust blue)))
        (send dc set-pen color 1 'solid)
        (send dc draw-point x y)))
    bm)
)

; Save ppm file bitmap->ppm 
(define (bitmap->ppm bitmap output-port)
  (define height (send bitmap get-height))
  (define width (send bitmap get-width))
  (define buffer (make-bytes (* width height 4))) ;buffer for storing argb data
  (send bitmap get-argb-pixels 0 0 width height buffer) ;copy pixels
  (parameterize ([current-output-port output-port]) 
    (printf "P3\n~a ~a\n255" width height) ;header 
    (for ([i (* width height)])
      (define pixel-position (* 4 i))
      (when (= (modulo i width) 0) (printf "\n")) ;end of row
      (printf "~s ~s ~s " 
              (bytes-ref buffer (+ pixel-position 1)) ;r
              (bytes-ref buffer (+ pixel-position 2)) ;g
              (bytes-ref buffer (+ pixel-position 3)))))) ;b
 
 
(call-with-output-file "pulsar.ppm" #:exists 'replace #:mode 'text
  (lambda (out)
    (let 
        ([bm (make-bitmap 17 17)])
        (bitmap->ppm bm out)
    )
  )
)

; To create an image with width and height, use the make-bitmap
;; function.
 
;; For example, let's make a small image here:
(define bm (make-bitmap 640 480))
 
;; We use a drawing context handle, a "dc", to operate on the bitmap.
(define dc (send bm make-dc))
 
;; We can fill the bitmap with a color by using a combination of
;; setting the background, and clearing.
(send dc set-background (make-object color% 0 0 0)) ;; Color it black.
(send dc clear)
 
;; Let's set a few pixels to a greenish color with set-pixel:
(define aquamarine (send the-color-database find-color "aquamarine"))
(for ([i 480])
  (send dc set-pixel i i aquamarine))
 
;; We can get at the color of a bitmap pixel by using the get-pixel
;; method.  However, it may be faster to use get-argb-pixels if we
;; need a block of the pixels.  Let's use get-argb-pixels and look
;; at a row starting at (0, 42)
(define buffer (make-bytes (* 480 4)))  ;; alpha, red, green, blue
(send dc get-argb-pixels 0 42 480 1 buffer)
 
;; We can inspect the buffer
(bytes-ref buffer 0) ;;  and see that the first pixel's alpha is 255,
(bytes-ref buffer 1) ;;  and the red, green, and blue components are 0.
(bytes-ref buffer 2)
(bytes-ref buffer 3)
 
;; If we are using DrRacket, we can just print the bm as a toplevel expression
;; to view the final image:
bm

