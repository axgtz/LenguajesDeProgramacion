/*
Prolog 101
Alejandro Gutierrez
A01019608

consult('socrates.pl').     %Loads new stuff 
reconsult('socrates.pl').   %Loads new stuff and modified
make                        %Loads the file again
*/

%Facts              you can move with,
man(socrates).
man(plato).

%Rules
mortal(X) :- man(X).

%Query
mortal(socrates).