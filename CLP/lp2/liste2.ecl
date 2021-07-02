

/* int(X,Y,Z): Z e' l'intersezione di X e Y,
   definita per ricorsione sul primo argomento */

int([],L2,[]).
int([X|L1],L2,[X|L]):- member(X,L2), !, int(L1,L2,L).
int([X|L1],L2,L):- int(L1,L2,L).


/* ESERCIZIO: definire uni(X,Y,Z): Z è l'unione di X e Y */

/* ESERCIZIO: Definire la relazione: subst(T,T1,L,L1) 	
"L1 e' la lista ottenuta da L sostituendo tutte le occorrenze del 
termine T con il termine T1 e lasciando invariati gli altri elementi"
*/


   
