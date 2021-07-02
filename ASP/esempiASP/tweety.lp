vola(X):- uccello(X), not ab(X). 

% "ab" dovrebbe essere: "eccezione-uccelli-volano"

ab(X):- pinguino(X). 

uccello(X):- pinguino(X). 
uccello(X):- canarino(X). 

canarino(tweety). 
uccello(fred).
pinguino(opus).


