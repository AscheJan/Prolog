matnr(612229).
nimm(E,[E|T],T).
nimm(E,[H|T] , [H|R]) :- nimm(E,T,R).