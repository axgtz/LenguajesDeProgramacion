#|
Roberto Alejandro Gutierrez Guillen
12/09/2019
Game where you guess the lucky number
|# ;Ask Gil about tail recursion
(define (guess-game uppLim);Function to generate rand num
    (printf "\nWELCOME TO THE NUMBER GUESS GAME\n\n")
    (let (
        [randNum (random 1 (+ uppLim 1))];Random recieve min and max limit
        )
        (begin
            (printf "The random number for debugging purposes is: ~a \n" randNum)
            (loopTurn randNum 1); Call looper function
        )
    );Declare variable scope ends
)

(define (loopTurn randNum numTries); function that loops
    (printf "Enter your guess: ")
    (let ([guess (read)]) ;assign variable from user input
        (cond 
            [ (= guess randNum) (printf "Congratulations, you won after ~a tries\n" numTries)];true
            [ (> guess randNum) (begin ;Guess is higher than number
                                    (printf "Enter a lower number\n")
                                    (loopTurn randNum (+ 1 numTries))
                                )]
            [ (< guess randNum) (begin ;Guess is lower than number
                                    (printf "Enter a higher number\n")
                                    (loopTurn randNum (+ 1 numTries))
                                )]
        )
    )
)
