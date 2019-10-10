% swipl to enter
% load the program ['arithmetic.pro'].
% Simple Arithmetic Operations
%Celsius to Farenheit
    %Use parameters to return
c_to_f(C,F) :-
    F is C * (9/5) + 32.% 'is' is the same as =  

f_to_c(F,C) :-
    C is (F - 32) * 5 / 9.

%Factorial
    %Base
factorial(0,1).

    %Cannot have evaluations inside the parameters
factorial(N,R) :-
    N > 0,
    N1 is N - 1,
    factorial(N1,S),
    R is N * S.

%Tail recursive factorial
factorial(0,R,R). %When arriving to 0, what i have so far its the answer

factorial(N,A,R) :- % N is current number, A are the calcs i have so far, R is the answer
    N > 0,
    N1 is N -1,
    A1 is N * A,
    factorial(N1, A1,R).