#|
Roberto Alejandro Gutierrez Guillen
08/09/2019

Use $.rkt in the repository where the file is located then use
$(load "next_day.rkt")
to load the program and to run it use:
$(next_day 1 1 1996)
|#
(define (next_day d m y) ; day month year

)
;function to detect number of days in a month
(define (num_days m y)
  (if (= m )
  )
)
;function to detect if leap year
(define (leap_year y)
  (if (= (remainder y 4) 0) ; if the number is divisible by 0
    (begin
      (if (and (not (= (remainder y 100) 0)) (= (remainder y 400) 0));if the number is divisible by 100 then is NOT a leap year
       (#t);true
       (#f);false
      )
    );true, returns 1
    (#f);false, returns 0
  )
)
