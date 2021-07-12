p(a).
p(b).
p(c).
p(d).
p(e).
p(f).
p(g).
p(h).


% GENERATE

% ci sono N ospiti
num(N) :- N = #count { X : p(X) }.
% ci deve essere un posto per ogni ospite
posto(1..N) :- num(N).
% ogni ospite deve essere seduta in esattamente 1 posto
{seduto(G,1..N)} = 1 :- p(G),num(N).

% DEFINE

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

% TEST

% non possono esserci persone sedute in due post
:-seduto(G,P1),seduto(G,P2),P1!=P2.
% non possono esserci posti con due persone sedute
:-seduto(G1,P),seduto(G2,P),G1!=G2.

% se vale nv(G1,G2) allora G1 e G2 non possono stare vicini
:-nv(G1,G2),p(G1),p(G2),seduto(G1,P1),seduto(G2,P2),vicino(P1,P2).

% un conflitto è guando vale nv(G1,G2) ma G1 e G2 sono semivicini
confilct(G1,P1,G2,P2):-nv(G1,G2),seduto(G1,P1),seduto(G2,P2),svicino(P1,P2).
conflict_count(N):- N = #count{G1,G2 : confilct(G1,G2,_,_)}.

% un soddisfatto è quando vale v(G1,G2) e G1, G2 sono vicini
happy(G1,P1,G2,P2):- v(G1,G2),seduto(G1,P1),seduto(G2,P2),vicino(P1,P2),not nv(G2,G1).
happy_count(N):- N = #count{G1,G2 : happy(G1,G2,_,_)}.


#minimize {N @2: conflict_count(N) }. % minimizzo i conflitto
#maximize {N @1: happy_count(N)}. % poi, massimizzo i soddisfatti

#show seduto/2.
#show conflict_count/1.
#show confilct/4.
#show happy_count/1.
#show happy/4.


seduto(b,3).
seduto(c,8).

% a vorrebbe stare vicino a b
v(a,b).
v(b,a).
v(d,e).
% b non vuole stare vicino a c
nv(b,c).
nv(e,d).