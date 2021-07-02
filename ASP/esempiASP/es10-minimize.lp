
1 { p(1..5) } 1 .

1 { q(1..5) } 1 .

:- p(1),q(1).

%%% questo minimizza la somma di:
%%% X tale che p(X)
%%% Y tale che p(Y)
%%% bisogna scrivere "X,p" e "Y,q" perche' considera l'insieme {(1,p) (2,q)}, 
%%% se no la sol minima sarebbe p(2) q(2) dove l'insieme è solo {2} con costo 2 

#minimize { X,p : p(X) ; Y,q : q(Y) }.

%%% due soluzioni:
%%% p(1) q(2)
%%% q(1) p(2) 


%%% il seguente minimizza Y tale che q(Y)
%%% e con priorita' minore X tale che p(X)

%#minimize { Y@2 : q(Y) }.
%#minimize { X@1 : p(X) }.

%%% una sola soluzione: 
%%% q(1) p(2)
