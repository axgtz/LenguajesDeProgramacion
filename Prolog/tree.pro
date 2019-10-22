/* 
swipl to enter
to load ['trees.pro'].
Roberto Alejandro Gutierrez Guillen
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

% Search for element
tree_element(X, node(R,_,_)) :-
    X = R.

tree_element(X, node(R,LT,_)) :-
    X < R,
    tree_element(X, LT).

tree_element(X, node(R,_,RT)) :-
    X > R,
    tree_element(X, RT).


% Insert new element X in the tree. return new tree
tree_insert(X, nil, node(X, nil, nil)).
tree_insert(X , node(R, LT, RT), node(, R, NLT, RT)) :-
    X < R,
    tree_insert(X, LT, NLT)

tree_insert(X , node(R, LT, RT), node(, R, LT, NANDORT)) :-
    X > R,
    tree_insert(X, RT, NRT)
