
2 { p(a);p(b);p(c);p(d);p(e) } 5 .


%%% la seguente minimizza, pesandoli 1 ciascuno, i fatti del tipo p(X)
%%% (all'interno delle {} viene sommato tante volte 1 per ogni 
%%% coppia (1,X) tale che p(X) ) :

%#minimize { 1,X : p(X) }.

%%% si ottengono tutte le soluzioni con 2 fatti p(.)


%%% l'eventuale priorità va messa dopo l'1
%%%
%%% togliendo il #minimize sopra e aggiungendo quanto segue si minimizza il
%%% numero di p(.) e con minor priorità il numero di q(.);
%%% si ottengono le soluzioni con p(b) e un altro p(.) che non sia p(a), 
%%% perché hanno un solo q(.)

%q(a) :- p(a).
%q(aa) :- p(a).

%q(c) :- p(c).
%q(d) :- p(d).
%q(e) :- p(e).

%#minimize { 1@2,X : p(X) }.
%#minimize { 1@1,X : q(X) }.
