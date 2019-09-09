#|
Roberto Alejandro Gutierrez Guillen
09/09/2019

Use $.rkt in the repository where the file is located then use
$(load "next_day.rkt")
to load the program and to run it use:
$(next_day 1 1 1996)
|#
(map (lambda (x) (* x x)) (list 1 2 3 4 5 6))
