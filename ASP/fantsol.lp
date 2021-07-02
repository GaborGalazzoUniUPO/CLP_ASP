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

4 { sq(X,Y): pers(X) } 4 :- squadra(Y).

:- sq(X,Y1),sq(X,Y2),Y1!=Y2.

% in ogni squadra c'e' un elfo

:- squadra(Y), not ha_elfo(Y).

ha_elfo(Y) :- sq(X,Y),elfo(X).


% il capo della squadra e' uno gnomo, se c'e',
% � un qualunque membro altrimenti

ha_gnomo(Y) :- sq(X,Y),gnomo(X).

1 { capo(X,Y) : sq(X,Y),gnomo(X) } 1 :- ha_gnomo(Y).

1 { capo(X,Y) : sq(X,Y) } 1 :- squadra(Y), not ha_gnomo(Y).

% squadre di forza almeno 15

val(V,Y) :- squadra(Y), #sum { S,X : s(X,S),sq(X,Y) } = V.

:- squadra(Y), #sum { S,X : s(X,S),sq(X,Y) } < 15.

% massimizza somma forze


#maximize { S,X : s(X,S),sq(X,Y) }.


#show sq/2.
#show capo/2.
#show val/2.