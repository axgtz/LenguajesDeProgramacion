/* 
swipl to enter
to load ['trees.pro'].
Roberto Alejandro Gutierrez Guillen
*/
%Relations to store valid tree
tree(1,node(a,node(b,node(d,nil,nil),nil),node(c,nil,node(x,nil,node(z,nil,nil))))).
tree(2,node(a,nil,nil)).
tree(3,nil).
tree(4,taco).

%Check if valid tree
is_tree(nil).
is_tree(node(_,LT,RT)) :- %Value, left tree(child), right tree (child)
    is_tree(LT),
    is_tree(RT).