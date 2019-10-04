%Facts
father(goku, gohan).
father(goku, goten).
father(bardock, goku).
father(bardock, raditz).
father(vegeta, trunks).
father(vegeta, bulla).
father(gohan, pan).
mother(videl, pan).
mother(gine, goku).
mother(gine, raditz).
mother(chichi, gohan).
mother(chichi, goten).
mother(bulma, trunks).
mother(bulma, bulla).
male(bardock).
male(goku).
male(vegeta).
male(gohan).
male(goten).
male(trunks).
female(videl).
female(pan).
female(gine).
female(chichi).
female(bulma).
female(bulla).

%Rules
brothers(X,Y) :-
    father(X,Y),
    father(Y,X),
    mother(X,Y),
    mother(Y,X),
    X \= Y. %X is not Y

brother(X,Y) :-
    brothers(X,Y),
    male(X).

sister(X, Y) :-
    brothers(X,Y),
    female(X).

grandfather(X, Y) :-
    male(X),
    father(X,Z),
    father(Z,Y).

grandmother(X, Y) :-
    female(X),
    mother(X,Z),
    mother(Z,Y).

grandchild(X, Y) :- %X grandchild, Y grandparent
    grandfather(Y,X);
    grandmother(Y,X).

grandson(X, Y) :-
    grandchild(X,Y),
    male(X).

granddaughter(X, Y) :-
    grandchild(X,Y),
    female(X).
