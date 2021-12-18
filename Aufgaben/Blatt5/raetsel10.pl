author(JanAsche).

nimm(E,[E|Y],Y).
nimm(E, [H|X], [H|Y]) :- nimm(E,X,Y).

negate(neg(X), pos(X)).
negate(pos(X), neg(X)).

resolvente(L1, L2, R) :- nimm(X, L1, L1without), nimm(Y, L2, L2without), union(L1without, L2without,R), negate(X,Y).

lenAcc([_|T],A,L) :- Anew is A+1, lenAcc(T,Anew,L).
lenAcc([], A, A).
len(L, Len) :- lenAcc(L, 0, Len).

anzahl(X) :- findall([F, A, K, E, C, S, T, O, R, Y], raetsel(F, A, K, E, C, S, T, O, R, Y), Los), len(Los, X).

ziffer(0).
ziffer(1).
ziffer(2).
ziffer(3).
ziffer(4).
ziffer(5).
ziffer(6).
ziffer(7).
ziffer(8).
ziffer(9).

raetsel(F, A, K, E, C, S, T, O, R, Y) :- 
	ziffer(E),
	Y is (E + E) mod 10, U1 is (E+E) // 10, 
	ziffer(K),
	R is (K + K + U1) mod 10, U2 is  (K + K + U1) // 10,
 	ziffer(A),  
 	O is (A + A + U2) mod 10, U3 is (A + A + U2) // 10,
 	ziffer(F), ziffer(C),
 	F=\=0, C=\=0,
 	T is (F + C + U3) mod 10, S is (F + C + U3) // 10,
	S=\=0, 	
	F =\= A, F =\= K, F =\= E, F =\= C, F =\= S, F =\= T, F =\= O, F =\= R, F =\= Y,
	A =\= K, A =\= E, A =\= C, A =\= S, A =\= T, A =\= O, A =\= R, A =\= Y,
	K =\= E, K =\= C, K =\= S, K =\= T, K =\= O, K =\= R, K =\= Y,
	E =\= C, E =\= S, E =\= T, E =\= O, E =\= R, E =\= Y,
	C =\= S, C =\= T, C =\= O, C =\= R, C =\= Y,
	S =\= T, S =\= O, S =\= R, S =\= Y,		
	T =\= O, T =\= R, T =\= Y,
	O =\= R, O =\= Y,
	R =\= Y.
	
