#|
Roberto Alejandro Gutierrez Guillen
08/09/2019

Use $.rkt in the repository where the file is located then use
$(load "next_day.rkt")
to load the program and to run it use:
$(next_day 1 1 1996)
|#
(define (next_day date) ; day month year
  ;(num_days (car (cdr date)) (car(cdr (cdr date))))
  ;Check day
  (cond
   [ (> 28 (first date)) (list (+ (first date) 1) (second date) (last date))];if days is less than 28 just add one day
   [ (and (= 28 (first date)) (= 2 (second date))) (if (leap_year (last date));28 feb and feb
                                                       (list (+ 1 (first date)) (second date) (last date));true leap, can have 29
                                                       (list 1 (+ 1 (second date)) (last date));false leap
   )]
   ; 29 feb
   [(= 29 (first date)) (if (= 2 (second date))                         
                         (list 1 (+ 1 (second date)) (last date)); true feb
                         (list (+ 1 (first date)) (second date) (last date));false not feb
                         )];29 but not feb
   [(> 31 (first date)) ((if (= 30 (num_days (second date) (last date)))
                             (list 1 (+ 1 (second date)) (last date));true add month
                             (list (+ 1 (first date)) (second date) (last date));false add day
                         ))];30 days
   [ (= 31 (first date)) (if (= 12 (second date));if december
                             (list 1 1 (+ 1 (last date)));true
                             (list 1 (+ 1 (second date)) (last date));false
                          )];31 days
  )
)

;function to detect number of days in a month, 30, 31 and feb
(define (num_days m y)
  (case m
    [ (1 3 5 7 8 10 12) 31]; 31 days
    [ (4 6 9 11) 30]; 30 days
    [ (2) (if (leap_year y) 28 29)];February
  )
)

;function to detect if leap year
(define (leap_year y)
  (if (= (remainder y 4) 0) ; if the number is divisible by 0
    (begin
      (if (or (not (= (remainder y 100) 0)) (= (remainder y 400) 0));if the number is divisible by 100 then is NOT a leap year
       #t;true
       #f;false
      )
    );true, returns 1
    #f;false, returns 0
  )
)
