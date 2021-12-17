matnr(612229).

label(leaf(X), X).
label(tree(A, B), X) :- label(A, X); label(B, X).

labels(leaf(X), [X]).
labels(tree(A, B), Z) :- labels(A, X), labels(B, Y), append(X, Y, Z).
