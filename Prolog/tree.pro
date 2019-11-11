/* 
swipl to enter
to load ['trees.pro'].
Roberto Alejandro Gutierrez Guillen
code also from Gilberto Echeverria
*/
% Relations to store valid tree
tree(1,node(a,node(b,node(d,nil,nil),nil),node(c,nil,node(x,nil,node(z,nil,nil))))).
tree(2,node(a,nil,nil)).
tree(3,nil).
tree(4,taco).

% Check if valid tree
is_tree(nil).
is_tree(node(_,LT,RT)) :- %Value, left tree(child), right tree (child)
    is_tree(LT),
    is_tree(RT).

%%% Search for an element inside the tree
tree_element(X, node(R, _, _)) :-
    X = R.

tree_element(X, node(R, LT, _)) :-
    X < R,
    tree_element(X, LT).
    
tree_element(X, node(R, _, RT)) :-
    X > R,
    tree_element(X, RT).
    tree_element(X, RT).

%%% Insert a new element X in the tree. The result is NewTree
% Base case
tree_insert(X, nil, node(X, nil, nil)).
% If the element is already in the tree, do nothing
tree_insert(X, node(R, LT, RT), node(R, LT, RT)) :-
    X = R.
tree_insert(X, node(R, LT, RT), node(R, NLT, RT)) :-
    X < R,
    tree_insert(X, LT, NLT).
tree_insert(X, node(R, LT, RT), node(R, LT, NRT)) :-
    X > R,
    tree_insert(X, RT, NRT).
    
% Convert a tree to ordered list
tree_inorder(nil,[]).

tree_inorder(node(R, LT, RT), L) :- % Left tree, Right tree
    tree_inorder(LT, LL),
    tree_inorder(RT, RL),
    append(LL, [R|RL],L).

%%% Print a nicely formatted tree
print_tree(nil, 0, _).
print_tree(Tree, Depth, Char).

%%% Delete an element from the tree
tree_delete(_, nil, nil).
% Find the element
tree_delete(X, node(R, LT, RT), node(R, NLT, RT)) :-
    X < R,
    tree_delete(X, LT, NLT).
tree_delete(X, node(R, LT, RT), node(R, LT, NRT)) :-
    X > R,
    tree_delete(X, RT, NRT).
% Delete the element found
% Leaf node
tree_delete(X, node(X, nil, nil), nil). % node without children
% Only one branch
tree_delete(X, node(X, LT, nil), LT). % node with just left tree
tree_delete(X, node(X, nil, RT), RT). % node with just right tree
% Two branches
tree_delete(X, node(X, LT, RT), node(Min, LT, NRT)) :- % node with both children 
    tree_min(RT, Min),
    tree_delete(Min, RT, NRT).


% Find the smallest number in a tree
tree_min(nil, nil).
tree_min(node(R, nil, _), R).
tree_min(node(_, LT, _), Min) :-
    tree_min(LT, Min).


%%% Print tree like a real tree               TODO 
aux_space(0).
aux_space(NS):- % Number of spaces
    write( ),
    NS1 is NS - 1,
    aux_space(NS1).

print_tree(nil, _). % Tree depth character

print_tree(node(R, LT, RT) , D) :-
    D1 = is D + 1,
    print_tree(RT, D1),
    aux_space(D),
    write(R),
    print_tree(LT, D1),