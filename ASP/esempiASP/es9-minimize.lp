
1 { p(1..5) } 1 .

1 { q(1..5) } 1 .

:- p(1),q(1).

%%% minimizza X tale che p(X)

#minimize { X : p(X) }.

