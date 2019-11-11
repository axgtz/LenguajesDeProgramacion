/* 
swipl to enter
to load ['treesHwk.pl'].
Roberto Alejandro Gutierrez Guillen
*/

%%% Compute the height of the tree. Two parameters, the tree and the resulting height
tree_height(nil,0).
tree_height(node(_, LT, RT), ResH) :- % is like max depth
    tree_height(LT, ResLH),
    tree_height(RT, ResRH),
    ResH is max(ResRH, ResLH) + 1. % return larger

%%% Generate a list of all the elements at the leafs of the tree (nodes without children). Two parameters, the tree and the resulting list
list_leaves(nil, []). % Base case
list_leaves(node(R, nil, nil), [R]). % is a young man with no children

list_leaves(node(_, LT, RT), ResLeaves):- % L = leaves
    list_leaves(LT,LLeaves), % left leaves
    list_leaves(RT,RLeaves), % right leaves
    append(LLeaves,RLeaves,ResLeaves).  % append both leaves from left and right trees


%%% Determine if a tree has the same structure on its left and right branches, inverted. Only parameter is a tree
symmetric_tree(nil).                %base case
symmetric_tree(node(_,nil,nil)).    %other base case, yound man with no childrens
symmetric_tree(node(_,LT,RT)):-     
    mirror_tree(LT,RT).


%%%  Used to solve the previous predicate. Compare two trees to see if they have a mirrored structure. Two arguments, both trees
mirror_tree(nil,nil).   %return true

% PROBLEM IS MIRROR TRREE
mirror_tree(node(_,LTreeLT,RTreeLT),node(_,LTreeRT,RTreeRT)):-
    mirror_tree(LTreeLT,RTreeRT), % branches pointing outside
    mirror_tree(RTreeLT,LTreeRT). % branches pointing towards center

%%% Print tree like a tree
% Print tree like a real tree         
aux_space(0).
aux_space(NS):- % Number of spaces
    write('   '),
    NS1 is NS - 1,
    aux_space(NS1).

% Aux func to print correct line, L = 2, R =1 , C = 0
aux_line(2) :-
    write('\\'),
    aux_line(0).

aux_line(1) :-
    write('/'),
    aux_line(0).

aux_line(0) :-
    write('-').

%Function to call print tree with depth 0 since start
print_tree(Tree) :-
    print_tree_aux(Tree, 0, 0).

print_tree_aux(nil, _ , _). % Tree depth character

print_tree_aux(node(R, LT, RT) , D, T) :- % D should start in 0, third means the type left, right or center
    D1 is D + 1,                        % add depth 
    print_tree_aux(RT, D1, 1),
    aux_space(D),
    aux_line(T),
    write(R),       
    put(10),                            % New line
    print_tree_aux(LT, D1, 2).

/*
Implementations of binary search trees in Prolog

Gilberto Echeverria
21/10/2019
*/

% Relations to store predefined trees
test_tree(1, node(6, node(2, nil, node(5, nil, nil)), node(8, nil, nil))).
% Invalid tree
test_tree(2, node(6, node(2, node(5, nil, nil)), node(8, nil, nil))).
test_tree(3, node(45, node(12, node(3, nil, nil), node(23, nil, nil)), node(52, node(48, nil, nil), node(59, nil, nil)))).
test_tree(4, node(45, node(12, node(3, nil, nil), node(23, nil, node(40, nil, nil))), node(52, node(48, nil, nil), node(59, nil, nil)))).

%%% Predicate to determine if an expression is a valid tree
% Base case fact
is_tree(nil).
% Recursive calls
is_tree(node(_, LT, RT)) :-
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

%%% Convert a tree into an ordered list
tree_inorder(nil, []).
tree_inorder(node(R, LT, RT), L) :-
    tree_inorder(LT, LL),
    tree_inorder(RT, RL),
    append(LL, [R|RL], L).

%%% Print a nicely formatted tree
print_tree(nil, 0, _).
%print_tree(Tree, Depth, Char).


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
tree_delete(X, node(X, nil, nil), nil).
% Only one branch
tree_delete(X, node(X, LT, nil), LT).
tree_delete(X, node(X, nil, RT), RT).
% Two branches
tree_delete(X, node(X, LT, RT), node(Min, LT, NRT)) :-
    tree_min(RT, Min),
    tree_delete(Min, RT, NRT).

% Find the smallest number in a tree
tree_min(nil, nil).
tree_min(node(R, nil, _), R).
tree_min(node(_, LT, _), Min) :-
    tree_min(LT, Min).
