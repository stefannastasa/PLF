% Aparitiile elementului maxim dintr-o lista:
%	(i,i,i),(i,i,o)
%	max_elem(L:lista, E:integer, R:integer)=
%		true, vida(L)
%		max_elem(tail(L), head(L)), head(L) > E
%		max_elem(tail(L), E), head(L) =< E
%	(i,i,i),(i,i,o)
%	sterge_elem(E, L:lista, Rasp:lista)=
%		true, vida(L)
%		sterge_elem(E, tail(L), [head(L)|Rasp]), E != head(L)
%		sterge_elem(E, tail(L), Rasp), E == head(L) 
%		
%	sterge_wrapper(L:Lista, Rasp:Lista)=
%		sterge_elem(E, L, Rasp), max_elem(L, E)
%
%	
max_elem([], R, R).
max_elem([X|Xs], C, R):- X > C, max_elem(Xs, X, R).
max_elem([X|Xs], C, R):- X =< C, max_elem(Xs, C, R).
max_elem([X|Xs], R):- max_elem(Xs, X, R).


sterge_elem(_, [], []).
sterge_elem(E, [X|Xs], [X|Rasp]):- E \== X, sterge_elem(E, Xs, Rasp).
sterge_elem(E, [X|Xs], Rasp):- E == X, sterge_elem(E,Xs,Rasp).

wrapper(L, Rasp):- max_elem(L, E), sterge_elem(E, L, Rasp).
