% formare squadre di personaggi fantasy

% squadre

squadra(a).
squadra(b).

% i personaggi

gnomo(g1).
fata(f1;f2;f3).
elfo(e1;e2;e3;e4;e5).

pers(X):-gnomo(X).
pers(X):-fata(X).
pers(X):-elfo(X).

% forza dei personaggi

s(g1,5).
s(f1,4).
s(f2,3).
s(f3,5).
s(e1,4).
s(e2,2).
s(e3,5).
s(e4,3).
s(e5,4).


% ogni squadra ha 4 elementi, usare sq(X,Y) per "X e' nella squadra Y"



% in ogni squadra c'e' un elfo



% il capo della squadra e' uno gnomo, se c'e',
% è un qualunque membro altrimenti



% squadre di forza almeno 15



% massimizza somma forze




#show sq/2.
