author(JanAsche).

:- ensure_loaded([al]).

flatten(A /\ B, X) :- flatten(A, Y), flatten(B, Z), append([Y, Z], X).
flatten(A \/ B, X) :- flatten(A, Y), flatten(B, Z), append([Y, Z], X).
flatten(A => B, X) :- flatten(A, Y), flatten(B, Z), append([Y, Z], X).
flatten(~ A, X) :- flatten(A, X).
flatten(A, [A]) :- as(A); bool(A).

as_in_al(A, X) :- flatten(A, B), member(X, B).

al2nnf(A, A, ~ A) :- as(A).

al2nnf(~ A, P, N) :- al2nnf(A, N, P).

al2nnf(A /\ B, AP /\ BP, AN \/ BN) :- al2nnf(A, AP, AN), al2nnf(B, BP, BN).
al2nnf(A \/ B, AP \/ BP, AN /\ BN) :- al2nnf(A, AP, AN), al2nnf(B, BP, BN).

al2nnf(A => B, P, N) :- al2nnf(~ A \/ B, P, N).
