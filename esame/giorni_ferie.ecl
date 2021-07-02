:- lib(clpr).

r1(Age,_,Extra):-{Age < 18,Extra = 5},!.
r1(Age,_,Extra):-{Age >= 60,Extra = 5},!.
r1(_,Service,Extra):-{Service >= 30,Extra = 5},!.
r1(_,_,Extra):-{Extra = 0}.

% r1(16,1,X) ok
% r1(19,1,X) ko
% r1(60,1,X) ok
% r1(19,30,X) ok

r2(Age,_,Extra):-{Age >= 60,Extra = 3},!.
r2(_,Service,Extra):-{Service >= 30,Extra = 3},!.
r2(_,_,Extra):-{Extra = 0}.

% r2(20,31,X) ok
% r2(50,29,X) ko
% r2(60,29,X) ok

r3(_,Service,Extra):-{Service >= 15,Service < 30,Extra = 2},!.
r3(Age,_,Extra):-{Age >= 45,Extra = 2},!.
r3(_,_,Extra):-{Extra = 0}.

% r3(40,15,X) ok
% r3(40,31,X) ko
% r3(50,31,X) ok

r1_3(Age,Service,Extra):-r1(Age,Service,Extra),{Extra > 0},!.
r1_3(Age,Service,Extra):-r3(Age,Service,Extra).


giorni_ferie(Age,Service,Total):-
    r1_3(Age,Service,Extra1),
    r2(Age,Service,Extra2),
    {Total = 22 + Extra1 + Extra2}.


eval_rules(_,_,Extra,[]):-{Extra = 0}.
eval_rules(Age,Service,Extra,[R|L]):-G=..[R,Age,Service,CurrentResult], call(G), eval_rules(Age,Service,RemaningResult,L), {Extra = CurrentResult + RemaningResult}.

eval_mutexrules(_,_,Extra,[]):-{Extra = 0}.
eval_mutexrules(Age,Service,Extra,[R|_]):-G=..[R,Age,Service,CurrentResult], call(G), {CurrentResult > 0, Extra = CurrentResult}, !.
eval_mutexrules(Age,Service,Extra,[_|L]):-eval_mutexrules(Age,Service,Extra,L).

giorni_ferie_g(Age,Service,Total,Base,Rules,MutexRules):-
    eval_rules(Age,Service,Extra1,Rules),
    eval_mutexrules(Age,Service,Extra2,MutexRules),
    {Total = Base + Extra1 + Extra2}.

% giorni_ferie_g(30,1,X,22,[r2],[r1,r3]) 22
% giorni_ferie_g(30,20,X,22,[r2],[r1,r3]) 24
% giorni_ferie_g(30,30,X,22,[r2],[r1,r3]) 24
% giorni_ferie_g(40,30,X,22,[r2],[r1,r3]) 30
% giorni_ferie_g(60,30,X,22,[r2],[r1,r3]) 30