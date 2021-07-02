p(a).
p(b).
p(c).

{q(X)} :- p(X).

cq(N) :- N = #count { X : q(X) }.
 
:- #count { X : q(X) } > 1.
