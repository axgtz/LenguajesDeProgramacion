#|
Roberto Alejandro Gutierrez Guillen
12/09/2019
Game where you guess the lucky number
|#
(define (guess-game uppLim);Function to generate rand num
    (printf "WELCOME TO THE NUMBER GUESS GAME\n\n")
    (let (
        [randNum (random 1 (+ uppLim 1))];Random recieve min and max limit
        )
        (begin
            (printf "The random number for debugging purposes is: ~a \n" randNum)
            (loopTurn randNum 1)
        )
    );Declare variable
)

(define (loopTurn randNum numTries); function that loops
    (printf "Enter your guess: ")
    (let ([guess (read)]) ;assign variable
        (cond 
            [ (= guess randNum) (printf "Congratulations, you won after ~a tries\n" numTries) ];true
            [ (> guess randNum) (loopTurn randNum (+ 1 numTries))]
            [ (< guess randNum) (loopTurn randNum (+ 1 numTries))]
        )
    )
)
#|
(define (loopTurn randNum numTries); function that loops
    (printf "Enter your guess: ")
    (if (= randNum (read))
        ;true, correct number
            (printf "Congratulations, you won after ~a tries\n" numTries);true
        ;false
            (loopTurn randNum (+ 1 numTries))
    )
)
|#
