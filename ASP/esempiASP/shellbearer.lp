% tipicamente i molluschi hanno il guscio

shellbearer(X) :- mollusc(X), not ab1(X). 

% i cefalopodi sono molluschi, ma fanno eccezione alla regola precedente

mollusc(X) :- cephalopod(X). 
ab1(X) :- cephalopod(X).
-shellbearer(X) :- cephalopod(X), not ab2(X). 

% il "-" in "-shellbearer" è la cosiddetta "negazione esplicita", 
% funziona come se ci fosse il constraint:
% :- shellbearer(X), -shellbearer(X).
% anche se qui non serve

% i nautilus sono cefalopodi, ma fanno eccezione all'eccezione

cephalopod(X) :- nautilus(X).
ab2(X) :- nautilus(X).
shellbearer(X) :- nautilus(X), not ab3(X).


mollusc(fred).
cephalopod(john).
nautilus(nemo).


