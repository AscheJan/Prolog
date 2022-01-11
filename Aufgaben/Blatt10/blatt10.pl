
:- module(pure_literal, [ knf_shell/0, pure_literal/2 ]).

%Jan Asche
%aschejaq
%612229

matnr(612229).

%(c)
:- use_module(al_def, [al/1]).
:- use_module(al_nf, [al2menge/2]).
:- use_module(al_literals, [negate_lit/2]).

%(d)
knf_shell :- read(X), knf_shell_core(X).

knf_shell_core(bye).
knf_shell_core(X) :- al(X), al2menge(X, Y), write(Y), knf_shell.

%(e)
pure_literal(KM, KM2) :- is_pure_literal(KM, X), !, findall(Y, pure_literal_cond(KM, X, Y), KM1), pure_literal(KM1, KM2).
pure_literal(KM, KM).

pure_literal_cond(KM, X, Y) :- member(Y, KM), not(member(X, Y)).

is_pure_literal(KM, X) :- append(KM, M), member(X, M), negate_lit(X, NX), not(member(NX, M)).