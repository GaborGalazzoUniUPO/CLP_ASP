vola(X):- uccello(X), not ab(X). 

% "ab" per "abnormal" ma dovrebbe essere: "eccezione-uccelli-volano"

ab(X):- pinguino(X). 

uccello(X):- pinguino(X). 
uccello(X):- canarino(X). 

uccello(fred).
canarino(tweety). 
pinguino(opus).

/* la negazione 

	not P

   è come se fosse definita così

*/

mynot(P):- call(P),!,fail.
mynot(P).

/*

ESERCIZIO: ridefinire l'intersezione di liste
usando la negazione e non usando direttamente "!"

*/

/* definire un predicato tutti_p(L)
che sia vero se p vale per gli elementi della lista L,
es. tutti_p([a,b,c]) deve essere equivalente a
p(a),p(b),p(c)
*/


/* generalizzare: utilizzando "=.." e "call" definire un predicato 
vale_per_tutti(P,L) che sia vero se P vale per gli elementi della lista L,
es. vale_per_tutti(p,[a,b,c]) deve essere equivalente a
p(a),p(b),p(c)
*/

		

   
