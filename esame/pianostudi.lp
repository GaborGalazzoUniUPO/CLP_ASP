% Modellare i possibili piani di studio della LM secondo il regolamento 
% della coorte 2020/21 
% usando i fatti qui indicati per i corsi considerati ai vari punti 
% del documento
% (al punto 5 qui si elencano solo i corsi attivati per il corso di studi)
%
% utilizzare un predicato scelto(corso,N) per rappresentare il fatto 
% che il "corso" viene scelto al punto N; 
% un corso non scelto ai punti 2 3 4 pu� essere scelto al punto 5

% il programma pu� essere usato per generare tutti i piani di studio, 
% o, ad esempio, indicando alcuni dei corsi scelti e trovando 
% le possibili soluzioni per gli altri

corso(1,calccomp,6).
corso(1,fondling,6).
corso(1,infret,6).

corso(2,compstat,6).
corso(2,datamin,6).
corso(2,metodiott,6).
corso(2,biocomp,3).
corso(2,dl,3).
corso(2,sisd,3).

corso(3,businta,9).
corso(3,mldl,9).
corso(3,intartsid,9).
corso(3,rclc,9).

corso(4,busintb,6).
corso(4,fwspsd,6).
corso(4,cybersec1,6).
corso(4,sismultimed,6).
corso(4,intart,6).
corso(4,hpc,6).
corso(4,mlearning,6).
corso(4,valprest,6).
corso(4,cybersec2,6).
corso(4,infforense,6).

corso(5,geomarketing,6).
corso(5,logcomp,3).
corso(5,appmobili,6).
corso(5,appweb,6).

%corso(Y):-corso(_,Y,_).
%scelto(Y):-scelto(_,Y).

{scelto(1,Y)} 1 :- corso(1,Y,_).
{scelto(2,Y)} 1 :- corso(2,Y,_).
{scelto(3,Y)} 1 :- corso(3,Y,_).
{scelto(4,Y)} 1 :- corso(4,Y,_).
{scelto(5,Y)} 1 :- corso(_,Y,_).

%:- #sum{CFU,S : scelto(X,S),corso(X,S,CFU)} <> 6 .

:- scelto(_,intartsid),scelto(_,intart).
:- scelto(_,intartsid),scelto(_,sisd).
:- scelto(_,mldl),scelto(_,ml).
:- scelto(_,mldl),scelto(_,dl).
:- scelto(_,businta),scelto(_,busintb).
:- scelto(_,rclc);scelto(_,fwspsd).
:- scelto(_,rclc);scelto(_,logcomp).
%
:- scelto(X,Y),scelto(Z,Y),X!=Z.
%
:- #sum{CFU,S : scelto(_,S),corso(_,S,CFU)} <> 81 .
%
:- #sum{CFU,S : scelto(1,S),corso(1,S,CFU)} <> 18 .
:- #sum{CFU,S : scelto(2,S),corso(2,S,CFU)} <> 12 .
:- #count{S:scelto(2,S),corso(2,S,3)}>0, #count{Y:scelto(3,Y)} <> 3 .
:- #count{S:scelto(2,S),corso(2,S,3)}=0, #count{Y:scelto(3,Y)} <> 1 .
:- #count{S:scelto(3,S),corso(3,S,_)}=1, #count{Y:scelto(4,Y)} <> 5 .
:- #count{S:scelto(3,S),corso(3,S,_)}=3, #count{Y:scelto(4,Y)} <> 2 .
:- #sum{CFU,S : scelto(5,S),corso(_,S,CFU)} <> 12 .
#show scelto/2.


scelto(2,metodiott).
scelto(2,compstat).
scelto(3,rclc).
scelto(4,busintb).
scelto(4,mlearning).
scelto(4,hpc).
scelto(4,cybersec2).
scelto(4,valprest).

scelto(5,dl).
scelto(5,datamin).

-scelto(4,intart).
-scelto(3,businta).