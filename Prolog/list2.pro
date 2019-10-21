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
element_at(0,[R|_],R). % When cumulative is 0 then is the desired index

element_at(C,[_|T],R):- % c = cumulative, iterates through the list by removing 1 from the index its looking and popping the elements at the head
    C1 is C - 1,
    element_at(C1,T,R).


%%% Is permutation
is_permutation(L1,L2) :-
    msort(L1, SL), % SL sorted list
    msort(L2, SL). % Check if SL is ordered version of L"
    %permutation(L1,L2).


%%% Remove contigous doubles 
%tec_remove_doubles(L,R):- % R no duplicates
 %   sort(L,R). %orders and removes all doubles

% Removes all doubles
tec_remove_doubles2([],[]). % Base case

tec_remove_doubles2([H|T],R):- 
    member(H,R),%if member
    tec_remove_doubles2(T, R).

tec_remove_doubles([],[]). % Empty list, ended the list, start recursion back

tec_remove_doubles([H|T], [H|R]) :- %Append Head if not repeated
    T \= [H|_], %Equivalent to \+ Term1 = Term2.
    tec_remove_doubles(T, R). %R tail with no duplicates

tec_remove_doubles([X,X|T], L) :- % Matches the head, and head of tail
    tec_remove_doubles([X|T], L). 
