p(a).
p(b).
p(c).
p(d).
p(e).
p(f).
p(g).
p(h).

%
%  2 3 4
% 1     5
%  8 7 6
%

num(N) :- N = #count { X : p(X) }.

posto(1..N) :- num(N).

%vicini adiacenti
vicino(K,M):-posto(K),posto(M),K-M=1.
vicino(1,N):-num(N).
vicino(K,M):-vicino(M,K).
%vicini lato lungo
vicino(K,M):-posto(K),posto(M),num(N),K+M=N+2,K!=M.
%semivicini
svicino(K,M):-svicino(M,K).
svicino(K,M):-posto(K),posto(M),num(N),K+M=N+1,K!=M,not vicino(K,M).
svicino(K,M):-posto(K),posto(M),num(N),K+M=N+3,K!=M,not vicino(K,M).


{seduto(G,1..N)} = 1 :- p(G),num(N).
:-seduto(G,P1),seduto(G,P2),P1!=P2.
:-seduto(G1,P),seduto(G2,P),G1!=G2.

:-nv(G1,G2),p(G1),p(G2),seduto(G1,P1),seduto(G2,P2),vicino(P1,P2).

conflict(N):- N = #count{G1,G2 : nv(G1,G2),seduto(G1,P1),seduto(G2,P2),svicino(P1,P2)}.
happy(N):- N = #count{G1,G2 : v(G1,G2),seduto(G1,P1),seduto(G2,P2),not nv(G2,G1),vicino(P1,P2)}.
v(a,b).
%nv(b,a).
nv(b,c).

#minimize {N @1: conflict(N) }.
#maximize {N @2: happy(N)}.

#show seduto/2.
#show conflict/1.
#show happy/1.