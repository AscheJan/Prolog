%Jan Asche
%aschejaq
%612229

:- module(pure_literal, [ knf_shell/0, pure_literal/2]).
:- use_module(al_def, [al/1]).
:- use_module(al_nf, [ al2menge/2 ]).
:- use_module(al_literals, [al_lit/1]).

knf_shell:- read(bye).
knf_shell:- read(X), tescht(X).


tescht(X):- al2menge(al(X), Y), write(Y).


pure_literal(X,Y):- is_pure_literal(A,X), reduce(A,X,Y).
pure_literal(_,[]).


is_pure_literal(al_lit(X),[al_lit(X)|_]).
is_pure_literal(A,[_|X]):- is_pure_literal(A,X).


reduce(A,[B|X],[B|Y]):- reduce(A,X,Y), not(enthalten(A,B)), rauskuerzen(A,B,B).
reduce(A,[B|X],[Y]):- reduce(A,X,Y), enthalten(A,B).
reduce(A,[B|X],[C|Y]):- reduce(A,X,Y), rauskuerzen(A,B,C).


enthalten(A,[A|_]).
enthalten(A,[_|C]):- enthalten(A,C).


rauskuerzen(A,[~ A|B],C):- rauskuerzen(A,B,C).
rauskuerzen(A,[X|B],[X|C]):- rauskuerzen(A,B,C).
rauskuerzen(_,[],_).