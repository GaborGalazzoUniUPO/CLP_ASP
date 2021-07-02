p(a).
p(b).
p(c).

{q(X)} :- p(X).

% con solo quanto sopra si hanno 8 modelli

% aggiungendo la seguente si eliminano quelli con q(a) perche' non hanno q(d)

%:- q(a), not q(d).

% aggiungendo invece la seguente (in logica classica equivalente alla 
% precedente) si aggiunge q(d) a tutti quelli con q(a)

%q(d) :- q(a).


