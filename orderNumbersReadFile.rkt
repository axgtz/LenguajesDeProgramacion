#|
Roberto Alejandro Gutierrez Guillen
26/09/2019

Read numbers from file then order them
|#
; Reading multiple lines from a file
(define (read-numbers file list)
    (let 
        ([line (read-line file)])
        ; Check if the line could be read
        (if (eof-object? line)
            (display "Finished Reading\n")
            (begin
                (append list line)
                (read-numbers file list)
            )
        )
    )
    (display list)
)

(define (prepare-read-numbers file)
    (read-numbers file '())
)

(call-with-input-file "test.txt" prepare-read-numbers)
