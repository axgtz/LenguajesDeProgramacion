/* 
swipl to enter
to load ['arithmetic.pro'].
*/
% Last element in the list
    % Base case, list with one element
custom_last([H|[]], H). % fact

    % Rules
custom_last([_|T],L) :- % _ variable anonima (se usa si no te interesa), T es el resto de la lista
    custom_last(T,L).

% Last element in the list . Recursive with tail
    %Base case, fact
get_lenght([], L ,L).

    %Rules
get_lenght([_|T], C ,L) :-      % [_|T],pop element from list
    C1 is C + 1,
    get_lenght( T,C1,L).

% Last element in the list . Recursive without tail
get_lenght([], 0).

    %Rules
get_lenght([_|T],L) :-  
    get_lenght(T,L1). %L1 its your return   
    L is L1 + 1.
