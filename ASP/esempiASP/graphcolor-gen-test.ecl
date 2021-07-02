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

sol(L) :- nodes(Nlist), lists(L,Nlist), not ko(L).

/* lists(L,Nlist) = è lista di coppie (colore,nodo) */

lists([],[]).
lists([(Color,N)|Rest],[N|RN]) :- lists(Rest,RN),color(Color).

ko(L) :- member((C,N1),L),member((C,N2),L),edge(N1,N2).


