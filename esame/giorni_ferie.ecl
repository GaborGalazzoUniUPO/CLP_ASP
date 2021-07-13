:- lib(clpr).

r1(Age,Service,5):-{Age<18;Age>=60;Service>=30}.
r1(Age,Service,0):-{Age >= 18,Age < 60, Service < 30}.


% r1(16,1,X) ok
% r1(19,1,X) ko
% r1(60,1,X) ok
% r1(19,30,X) ok

r2(Age,Service,3):-{Age >= 60; Service >= 30}.
r2(Age,Service,0):-{Age < 60, Service < 30}.

% r2(20,31,X) ok
% r2(50,29,X) ko
% r2(60,29,X) ok

r3(Age,Service,2):-{(Service >= 15,Service < 30);Age >= 45}.
r3(Age,Service,0):-{(Service < 15;Service >= 30), Age < 45}.

% r3(40,15,X) ok
% r3(40,31,X) ko
% r3(50,31,X) ok

r1_3(Age,Service,Extra):-r1(Age,Service,Extra),{Extra>0}.
r1_3(Age,Service,Extra):-r1(Age,Service,0), r3(Age,Service,Extra).

giorni_ferie(Age,Service,Total):-
    r1_3(Age,Service,Extra1),
    r2(Age,Service,Extra2),
    {Age > 0, Service > 0, Total = 22 + Extra1 + Extra2}.

% giorni_ferie(30,1,X)


eval_rules(_,_,0,[]).
eval_rules(Age,Service,Extra,[R|L]):-G=..[R,Age,Service,CurrentResult], call(G), eval_rules(Age,Service,RemaningResult,L), {Extra = CurrentResult + RemaningResult}.

eval_mutexrules(_,_,0,[]).
%eval_mutexrules(Age,Service,Extra,[R|_]):-G=..[R,Age,Service,Extra], call(G), {Extra > 0}.
%eval_mutexrules(Age,Service,Extra,[R|L]):-G=..[R,Age,Service,0], call(G), eval_mutexrules(Age,Service,Extra,L).

eval_mutexrules(Age,Service,Extra,[R|L]):-G=..[R,Age,Service,Extra], call(G), eval_mutexrules(Age,Service,Extra2,L), {Extra > Extra2}.
eval_mutexrules(Age,Service,Extra,[R|L]):-G=..[R,Age,Service,Extra1], call(G), eval_mutexrules(Age,Service,Extra,L), {Extra >= Extra1}.


giorni_ferie_g(Age,Service,Total,Base,Rules,MutexRules):-
    eval_rules(Age,Service,Extra1,Rules),
    eval_mutexrules(Age,Service,Extra2,MutexRules),
    {Age > 0, Service > 0, Total = Base + Extra1 + Extra2}.

% giorni_ferie_g(30,1,X,22,[r2],[r1,r3]) 22
% giorni_ferie_g(30,20,X,22,[r2],[r1,r3]) 24
% giorni_ferie_g(40,30,X,22,[r2],[r1,r3]) 30
% giorni_ferie_g(60,30,X,22,[r2],[r1,r3]) 30

