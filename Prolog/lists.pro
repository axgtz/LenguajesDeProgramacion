/* 
swipl to enter
to load ['lists.pro'].
You can call your function between time(). to tell you execution
*/
%%%Last
% Last element in the list - car en scheme
    % Base case, list with one element
custom_last([H|[]], H). % fact

    % Rules
custom_last([_|T],L) :- % _ variable anonima (se usa si no te interesa), T es el resto de la lista
    custom_last(T,L).

%%%Length
%Get length . Recursive with tail
    %Base case, fact
get_length([], L ,L).

    %Rules
get_length([_|T], C ,L) :-      % [_|T],pop element from list
    C1 is C + 1,
    get_length( T,C1,L).

%Length of list. Recursive without tail
get_length([], 0).% Fact, base case

    %Rules
get_length([_|T],L) :-  
    get_length(T,L1), %L1 its your return   
    L is L1 + 1.

%%%Reverse
tec_reverse(L,R) :- %L is list to reverse, R is answer
    reverse_custom(L,R,[]). % [] result so far, R end result

reverse_custom([],R,R). % Base

reverse_custom([H|T], R ,A) :- % A result so far, R final result
    reverse_custom(T,R,[H|A]). % [H|A]) = append


%%%Append 2 lists
tec_append([],L,L). %Base 

tec_append([H1|T1],L2,[H1|R]) :- %Recursive
    tec_append(T1,L2,R).

%%% Multiply by 2 each element of the list
double_elements([],[]). %Base
double_elements([H|T],[X|R]) :-
    X is H << 1,
    double_elements(T,R).