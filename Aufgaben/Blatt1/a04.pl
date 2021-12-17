verwandt(luke, lea).
gute_seite(han).
mag(lea, han).
mag(luke, X) :- verwandt(luke , X).
mag(luke, X) :- gute_seite(X).
verfolgt(han, lea).
verfolgt(darth_vader, X) :- mag(luke , X).