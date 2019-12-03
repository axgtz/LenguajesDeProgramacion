#|
    Christian Aguilar Piña
    Roberto Alejandro Gutierrez Guillen
    02/12/2019
    Project - Game of Life

    use rkt
    to load use (enter! "gameOfLifeDr.rkt")
    then use (main) to execute ;
|#
#lang racket
(require 2htdp/image 2htdp/universe)
(require racket/async-channel)

;;; Create Empty Grid object
(define (make-empty-grid m n) ; creates empty grid
  (build-vector m (lambda (y) (make-vector n 0))))

;;; Get height of grid
(define rows vector-length) 

;;; Get width of grid
(define (cols grid)
  (vector-length (vector-ref grid 0)))

;;; Grid with living cells
(define (make-grid m n living-cells)
  (let loop ([grid (make-empty-grid m n)]
             [cells living-cells])
    (if (empty? cells)
        grid
        (loop (2d-set! grid (caar cells) (cadar cells) 1) (cdr cells)))))

;;; Get cell 
(define (2d-ref grid i j) ; access   vec[i][j]
  (cond [(< i 0) 0] ;edge case 
        [(< j 0) 0]  
        [(>= i (rows grid)) 0]
        [(>= j (cols grid)) 0]
        [else (vector-ref (vector-ref grid i) j)]))

;;; Gets cells 
(define (2d-refs grid indices) ; fills list 
  (map (lambda (ind) (2d-ref grid (car ind) (cadr ind))) indices))

;;; Set a cell
(define (2d-set! grid i j val) ; Vector Set for 2d vec[i][j]= val
  (vector-set! (vector-ref grid i) j val) grid)
 
;;; cartesian product of 2 lists, get indices
(define (cart l1 l2)
  (if (empty? l1)
      '()
      (append (let loop ([n (car l1)] [l l2])
                (if (empty? l)
                    '()
                    (cons (list n (car l)) (loop n (cdr l)))))
              (cart (cdr l1) l2)
      )
  )
)
 
;;; Count living cells in the neighbourhood
(define (count-neighbours grid i j)
  (- (apply + (2d-refs grid (cart (list (- i 1) i (+ i 1))
                                  (list (- j 1) j (+ j 1)))); indexes of neighbours
     )
     (2d-ref grid i j)
  )
)
 
;;; Rules
; The number of neighbours is used as an index
(define conway-rules 
    (list->vector   (list (list->vector '(0 0 0 1 0 0 0 0 0))  #| Dead cell -Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.  |#
                      (list->vector '(0 0 1 1 0 0 0 0 0));alive
                    )))
;;; Next state of cell
(define (next-state-cell grid i j) 
  (let ([current (2d-ref grid i j)]    [N (count-neighbours grid i j)])
    (2d-ref conway-rules current N) ; rules arrays, live or dead, num of neighbours
   )
); returns the next value of the cell


;;; Channels
(define work-channel (make-async-channel 1000))
(define result-channel (make-async-channel 1000))

;;; Worker thread -  gets row and calculates next iteration of row
(define (make-worker thread-id)
  (thread (lambda ()
       (let loopItems ()
           (define itemList (async-channel-get work-channel))
           (case (list-ref itemList 0)
             [(end) (printf "")]
             [else
              (let loopCols ([i (list-ref itemList 0)] [grid (list-ref itemList 2)] [j 0] [vec (make-vector (list-ref itemList 1))])
                       (if (>= j (cols grid))
                           (async-channel-put result-channel (append (list i) (list vec)));true - done  - put in result channel
                           (begin
                             (vector-set! vec j (next-state-cell grid i j)) ;false
                             (loopCols i grid (+ 1 j) vec)
                           )
                        )
                    )
              (loopItems)]
            )
       ) ; loops rows
 ))
)

;;; Threads

;;; Next grid threads
(define (next-gridT grid)
  (let ([new-grid (make-empty-grid (rows grid) (cols grid))]) ; create new grid, uses the dimentions of the previous one
    (define threads (map make-worker '(1 2 3 4)))
    (let loop ([i 0])
      (if (>= i (rows grid))
          (begin (async-channel-put work-channel '(end)) (async-channel-put work-channel '(end)) (async-channel-put work-channel '(end)) (async-channel-put work-channel '(end)))
          (begin (async-channel-put work-channel (append (list i) (list (cols grid)) (list grid))) (loop (+ i 1)) )
          )
    )
    (for-each thread-wait threads)
    (async-channel-put result-channel '(end))
    ;(printf " threads finished\n")
    (let loop ()
      (define item (async-channel-get result-channel))
      (case (list-ref item 0)
             [(end) new-grid]
             [else (begin     (vector-set! new-grid (list-ref item 0) (list-ref item 1))
                              ;(printf "results ~a ~a \n"  (list-ref item 0)  (list-ref item 1)))
                              (loop))]
      )
   )
 )
)

;;; OG next grid - no threads =(
(define (next-grid grid)
  (let ([new-grid (make-empty-grid (rows grid) (cols grid))]) ; create new grid
    (let loop ([i 0] [j 0])
      (if (>= i (rows grid))
          new-grid ; true, return finished grid
          (if (>= j (cols grid)) ; iterate
              (loop (+ i 1) 0) ;true - next row
              (begin (2d-set! new-grid i j (next-state-cell grid i j)) ; new row
                     (loop i (+ j 1)) ;false -  itarate in a row the cols
              )
          )
      )
    )
  )
)

;;; Copy new grid to old 
(define (next-grid! grid)
  (let ([new-grid (next-gridT grid)])
    (let loop ((i 0))
      (if (< i (rows grid))
        (begin (vector-set! grid i (vector-ref new-grid i))
               (loop (+ i 1)))
        grid)
    )
  )
)
 
;;; Display image
(define (grid->image grid)
  (let ([y (rows grid)] [x (cols grid)] [size 5]) ; size = pixel size
    (let loop ([img (rectangle (* y size) (* x size) "solid" "white")];background
               [i 0] [j 0])
      (if (>= i (rows grid)) ; Go through rows
          img ; true return image, cause done
          (if (>= j (cols grid)) ; Go through cols in a row
              (loop img (+ i 1) 0) ; continue to nxt row
              (if (= (2d-ref grid i j) 1)
                  (loop (underlay/xy img (* i (+ 1 size)) (* j (+ 1 size))
                                     (square size "solid" "black"))
                        i (+ j 1)
                  ) ; draw the boxes
                  (loop img i (+ j 1))
               )
          )
        )
     )
   )
)
 
 
 ; Main, iteration loop sort of, 28 ticks per second
(define (game-of-life grid refresh_time)
    (animate (lambda (n)
                (if (= (modulo (+ 1 n) refresh_time) 0)
                    (grid->image (next-grid! grid));true, go and calculate image
                    (grid->image grid);false display image
                )
            )
    )
)

(define (main)
  (game-of-life (pulsar) 28)
)

;;; Examples
(define (stopLight)
  (make-grid 3 3 '((0 1) (1 1) (2 1))))

(define (stopLight2)
  (make-grid 3 10 '((1 0) (1 1) (1 2))))

(define (pulsar)      ; izq              ;up                 ;right              ;down
  (make-grid 20 20 '((2 4) (2 5) (2 6) (4 2) (5 2) (6 2) (7 4) (7 5) (7 6) (4 7) (5 7) (6 7); 1
                     (9 4) (9 5) (9 6) (10 2) (11 2) (12 2) (14 4) (14 5) (14 6) (10 7) (11 7) (12 7);2
                     (2 10) (2 11) (2 12) (4 9) (5 9) (6 9) (7 10) (7 11) (7 12) (4 14) (5 14) (6 14); 3
                     (9 10) (9 11) (9 12) (10 9) (11 9) (12 9) (14 10) (14 11) (14 12) (10 14) (11 14) (12 14);4
                           )))

(define (lighting)
  (make-grid 70 50 '((30 19) (30 20) (30 21) (29 17) (30 17) (31 17))))
