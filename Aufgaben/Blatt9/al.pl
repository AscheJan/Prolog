:- op(100, fy, ~).     % Negation
:- op(200, xfx, /\).   % Konjunktion
:- op(200, xfx, \/).   % Disjunktion
:- op(300, xfx, =>).   % Implikation

% boolesche Konstanten 0 und 1
bool(0).
bool(1).



% Aussagensymbole werden durc Atome repräsentiert
as(X) :- atom(X).



% al(X) besagt: X repräsentiert eine aussagenlogische Formel

%  Die booleschen Konstanten sind aussagenlogische Formeln.
al(B) :- bool(B).

%  Jedes Aussagensymbol ist eine aussagenlogische Formel.
al(X) :- as(X).

%  Die Negation einer aussagenlogischen Formel ist auch eine aussagenlogische Formel
al(~ F) :- al(F).

%  Konjunktion, Disjunktion und Implikation von zwei aussagenlogischen Formeln sind auch aussagenlogische Formeln
al(F1 /\ F2) :- al(F1), al(F2).
al(F1 \/ F2) :- al(F1), al(F2).
al(F1 => F2) :- al(F1), al(F2).



% al_lit(F) besagt: F repräsentiert ein Literal
al_lit(X) :- as(X).
al_lit(~ X) :- as(X).



% al_nnf(X) besagt: X repräsentiert eine aussagenlogische Formel in Negationsnormalform

%  Jedes Literal ist in NNF
al_nnf(F) :- al_lit(F).

% Konjunktion und Disjunktion zweier NNF sind auch in NNF
al_nnf(F1 /\ F2) :- al_nnf(F1), al_nnf(F2).
al_nnf(F1 \/ F2) :- al_nnf(F1), al_nnf(F2).



% Ein paar Beispiele für AL-Formeln
al_example(0).
al_example(a).
al_example(~ b).
al_example(~ (a /\ b)).
al_example(a => (c \/ ~b)).
al_example(~(~ (a /\ b) \/ (c => d))).

