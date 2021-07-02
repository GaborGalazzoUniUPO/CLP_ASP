% dalla Potassco Guide
%
% course(X,Y,Z) = X è un corso dell'area Y con Z ore a settimana
%
% NB uno stesso corso appartiene a più aree


course( 1,1,5; 1,2,5               ).
course( 2,1,4; 2,2,4               ).
course( 3,1,6;        3,3,6        ).
course( 4,1,3;        4,3,3; 4,4,3 ).
course( 5,1,4;               5,4,4 ).
course(        6,2,2; 6,3,2        ).
course(        7,2,4; 7,3,4; 7,4,4 ).
course(               8,3,5; 8,4,5 ).

% iscriversi a 3-6 corsi

3 { enroll(C) : course(C,S,H) } 6.

% il numero di coppie (corso,area) per i corsi scelti e' almeno 10 

:-   #count { C,S :     enroll(C), course(C,S,H) } 10.

% come osserva la guida è equivalente scrivere:
%
% :- { course(C,S,H) : enroll(C) } 10.
%
% perché per ogni C,S c'è solo un H tale che vale course(C,S,H)

% si scarta al piu' un corso dell'area 2

:- 2 #count { C : not enroll(C), course(C,2,H) }.

% non ci sono 6 o più coppie (C,A) di corsi dell'area A=3 o A=4

:- 6 #count { C,3 :     enroll(C), course(C,3,H);
              C,4 :     enroll(C), course(C,4,H) }.

%% NB fa differenza usare C,3 e C,4 o semplicemente C: 

c(N) :- N= #count { C,3 :     enroll(C), course(C,3,H);
              C,4 :     enroll(C), course(C,4,H) }.

% nella seguente se un corso è per più aree viene contato 1 volta sola
c1(N) :- N= #count { C :     enroll(C), course(C,3,H);
              C :     enroll(C), course(C,4,H) }.

#show c/1.
#show c1/1.

hours(C,H) :- course(C,S,H).
max_hours(20).

% il numero di ore e' compreso tra 18 e 20 (M-2 e M)

:- not M-2 #sum { H,C : enroll(C), hours(C,H) } M, max_hours(M).

% scegliere corsi di più di 2 ore

:-   #min { H,C : enroll(C), hours(C,H) } 2.

% scegliere corsi di meno di 6 ore

:- 6 #max { H,C : enroll(C), hours(C,H) }.

courses(N) :- N = #count { C : enroll(C) }.
hours(N) :- N = #sum { H,C : enroll(C), hours(C,H) }.


#show enroll/1.
#show courses/1.
#show hours/1.

