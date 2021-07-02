p(a).
p(b).
p(c).

{q(X)} :- p(X).

%:- q(a),q(b).

:- q(a), not q(b).
