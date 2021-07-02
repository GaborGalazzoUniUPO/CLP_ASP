
%%% hd(nome,capacita',prezzo)

hd(a,250,30).
hd(b,500,40).
hd(c,750,60).
hd(d,1000,80).
hd(e,1000,70).
hd(f,500,30).

1 { choose(X) : hd(X,C,P) } 1.

%%% massimizza capacita', e a parita' di quella minimizza il prezzo:

#maximize { C@2 : choose(X),hd(X,C,P) }.
#minimize { P@1 : choose(X),hd(X,C,P) }.

%%% oppure minimizza prezzo/capacita' (moltiplicato 1000 perche' solo num interi)

%#minimize { 1000*P/C : choose(X),hd(X,C,P) }.


#show choose/1.
