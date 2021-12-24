%Jan Asche
%aschejaq
%612229

matnr(612229).

:- ensure_loaded([al]).
:- ensure_loaded([kinodb]).


% (Aufgabe a)
clooney(R) :-
    findall((K, Z), clooneyPred(K, Z), R).

clooneyPred(K, Z) :- 
    programm(K, F, Z),
    film(F, 'George Clooney', _).

% (Aufgabe b)
:- dynamic belegt/3.

reservieren(P, Z, S) :-
    programm('Babylon', _, Z),
    not(belegt(_, Z, S)),
    assert(belegt(P, Z, S)).

% (Aufgabe c)
% retract scheitert wenn der angegebene Fakt nicht gespeichert ist
stornieren(Z, S) :- retract(belegt(_, Z, S)).

% (Aufgabe d)
unit_propagation(K, K2) :- member([X], K), !, map_filter(K, unit_propagation_filter(X), K1), unit_propagation(K1, K2).
unit_propagation(K, K).

unit_propagation_filter(X, L, L2) :- not(member(X, L)), neg(X, NX), filter(L, \=(NX), L2).

neg(~ X, X) :- !.
neg(X, ~ X).

% map(List, MapFilter, MappedList)
% removes elements X where MapFilter(X, _) fails
% maps elements X to Y with MapFilter(X, Y) otherwise
map_filter([], _, []).
map_filter([Y | L], MapFilter, [Z | LM]) :- call(MapFilter, Y, Z), !, map_filter(L, MapFilter, LM).
map_filter([_ | L], MapFilter, LM) :- map_filter(L, MapFilter, LM).

% filter(List, FilterGoal, FilteredList)
filter(L, Filter, LF) :- map_filter(L, filter_map_filter_goal(Filter), LF).
filter_map_filter_goal(Filter, X, X) :- call(Filter, X).