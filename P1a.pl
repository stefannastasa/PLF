% se_repeta(E, V:list, dupl)=
%	true, dupl=true si head(V)=E
%	false, vida(V)
%	se_repeta(E, tail(V), true), dupl=false si head(V)=E
%	se_repeta(E, tail(V), false)
%	
%	(i,i,i)
% constr_aux(X:list, H:list, Res:list)=
% 	constr_aux(X, tail(H), [head(H)|Res]), se_repeta(head(H),X,false)
% 	true, constr(aux,[],Res)
%	(i,i,i)(i,i,o)


se_repeta(E, [E|_], X) :- X==true.
se_repeta(E, [E|G], X) :- X==false, se_repeta(E, G,true).
se_repeta(E, [_|G], X) :- se_repeta(E, G, X).

constr_aux(X,[],[]).
constr_aux(X,[],Res).
constr_aux(X,[E|H], [E|Res]):- \+ se_repeta(E,X,false), constr_aux(X, H, Res).
constr_aux(X,[_|H], Res):- constr_aux(X,H,Res).


constr(H,Res) :- constr_aux(H,H,Res).


main:- constr([1,2,1,4,1,3,4],R).
