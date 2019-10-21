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
%Aux Length of list. Recursive without tail
get_length([], 0).% 

get_length([_|T],L) :-  
    get_length(T,L1), %L1 its your return   
    L is L1 + 1.

odd_length(L):-
    get_length(L,LEN),
    \+ 0 is LEN mod 2.
    % Other ways to do it: 
    %1 is LEN mod 2.
    %LEN mod 2 =:= 1.

%%% Return element at specified index, I = index to look for, currently is 0
element_at(0,[H|_],R):- % When cumulative is 0 then is the desired index
    R = H.

element_at(C,[_|T],R):- % c = cumulative
    C1 is C - 1,
    element_at(C1,T,R).


%%% Is permutation
is_permutation(L1,L2) :-
    msort(L1, SL), % SL sorted list
    msort(L2, SL). % Check if SL is ordered version of L"
    %permutation(L1,L2).


%%% Remove contigous doubles 
%tec_remove_doubles(L,R):- % R no duplicates
 %   sort(L,R).

tec_remove_doubles([],[]). % Base case

tec_remove_doubles([H|T],R):- 
    member(H,R),%if member
    tec_remove_doubles(T, R).