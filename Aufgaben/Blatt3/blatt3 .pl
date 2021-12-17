matnr(612229).
lauf(start).
lauf(vorwaerts(X)) :- lauf(X).
lauf(zurueck(X)) :- lauf(X).
laufDerDinge(start).
laufDerDinge(zurueck(X)) :- laufDerDinge(X).
laufDerDinge(zurueck(zurueck(vorwaerts(X)))) :- laufDerDinge(X).
endeGutAllesGut(X) :- endeGutAllesGut(X, Y,Z), greater(Y,Z).
endeGutAllesGut(start,0,0).
endeGutAllesGut(vorwaerts(X),succ(Y),Z):-endeGutAllesGut(X,Y,Z).
endeGutAllesGut(zurueck(X),Y,succ(Z)):-endeGutAllesGut(X,Y,Z).
greater(succ(_),0).
greater(succ(X),succ(Y)) :- greater(X,Y).
