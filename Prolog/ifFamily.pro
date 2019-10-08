% You can use trace to see how the logic works 
%Facts
father(goku, gohan).
father(goku, goten).
father(bardock, goku).
father(bardock, raditz).
father(vegeta, trunks).
father(vegeta, bulla).
father(gohan, pan).
father(drBrief, bulma).
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

%having 2 rules writen the same is like having an OR
%father side
grandfather(X, Y) :- %X is gandfather of Y
    father(X,Z),
    father(Z,Y).

%mother side
grandfather(X, Y) :-
    father(X,Z),
    mother(Z,Y).

%father side
grandmother(X, Y) :-
    mother(X,Z),
    father(Z,Y).

%mother side
grandmother(X, Y) :-
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
