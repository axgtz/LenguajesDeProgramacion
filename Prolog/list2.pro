/* 
swipl to enter
to load ['list2.pro'].
Roberto Alejandro Gutierrez Guillen
*/
%%% Find in List
in_list([E|_],E).   %Base case, Fact. if element is part of list
in_list([_|T],E):-  %Rule, pop first element of list
    in_list(T,E).   %Call again with list reduced by one element
    
%%% Is odd length
%odd_length(L).

%%% Return element at specified index
%n_th_element(I,L,X). 

%%% Is permutation
is_permutation(L1,L2) :-
    permutation(L1,L2).

%%% Remove contigous doubles 
tec_remove_doubles(L,R):- % R no duplicates
    sort(L,R).