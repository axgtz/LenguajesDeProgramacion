#|
Roberto Alejandro Gutierrez Guillen
26/09/2019

Read numbers from file then order them
|#
; Reading multiple lines from a file
(define (read-numbers file list)
    (let 
        ([line (read-line file)] [listNum list])
        ; Check if the line could be read
        (if (eof-object? line)
            (display "Finished Reading\n")
            (begin
                (append listNum (list (string->number line)))
                (read-numbers file listNum)
            )
        )
    )
    (display listNum)
)

(define (prepare-read-numbers file)
    (read-numbers file '())
)

(call-with-input-file "test.txt" prepare-read-numbers)
