author(JanAsche).

not_member(_, []).
not_member(X, [X | _]) :- !, fail.
not_member(X, [_ | L]) :- not_member(X, L).

:- ensure_loaded([al]).

:- op(300, xfx, <=>).   % Biimplikation

al_bin(A <=> B, A, B, C <=> D, C ,D).
al_bin(A => B, A, B, C => D, C ,D).
al_bin(A /\ B, A, B, C /\ D, C ,D).
al_bin(A \/ B, A, B, C \/ D, C ,D).

tseitin(X, L) :- tseitin(X, LX, SX), append([[SX], LX], L).

% tseitin(Expression, Equivalences, NewExpressionSymbol)
tseitin(X, [], X) :- al_lit(X).
tseitin(X, L, S) :- al_bin(X, A, B, XRenamed, SA, SB),
                    tseitin(A, LA, SA), tseitin(B, LB, SB),
                    gensym(x, S), append([[S <=> XRenamed], LA, LB], L).

tseitin(~ X, L, S) :- tseitin(X, LX, SX),
                    gensym(x, S), append([[S <=> ~ SX], LX], L).

% tseitin((p => ~q) \/ (~ (p /\ q) /\ r), L).
