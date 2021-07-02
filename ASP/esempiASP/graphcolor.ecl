/* soluzione in programmazione logica, non in ASP */

node(1).
node(2).
node(3).
node(4).
node(5).
node(6).

edge(1,2).  edge(1,3).  edge(1,4).  
edge(2,4).  edge(2,5).  edge(2,6).  
edge(3,1).  edge(3,4).  edge(3,5).
edge(4,1).  edge(4,2).
edge(5,3).  edge(5,4).  edge(5,6).  
edge(6,2).  edge(6,3).  edge(6,5).

color(r).
color(b).
color(g).

nodes(Nlist) :- setof(X,node(X),Nlist).

/* sol(L) = L lista di coppie (colore,nodo) che costituisce una soluzione */

sol(L) :- nodes(Nlist), sol(L,Nlist).

sol([],[]).
sol([(Color,N)|Rest],[N|RN]) :- sol(Rest,RN),color(Color), not ko(Color,N,Rest).

/* data una soluzione per gli altri nodi, scelgo un colore per N che vada bene
rispetto a quelli già assegnati */

ko(Color,N,L) :- member((Color,K),L),edge(N,K).
ko(Color,N,L) :- member((Color,K),L),edge(K,N).


