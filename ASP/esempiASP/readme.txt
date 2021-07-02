BREVI ISTRUZIONI PER L'USO di clingo

In laboratorio clingo è in /opt/clingo (alias per /opt/clingo-4.5.4)

Il sito del tool è https://potassco.org/

La guida si trova su https://github.com/potassco/guide/releases/

---------------------------------------------------------------

Il comando:

clingo nomefile(s) 

fornisce un answer set (se esiste; UNSATISFIABLE se no); 
"1+" come numero di modelli indica che ce ne sono altri

viene scritto l'intero contenuto dell'answer set se nei file non ci sono 
direttive del tipo #show p/n. , altrimenti solo la parte relativa ai predicati 
indicati da #show con relativa arietà 

Il comando:

clingo N nomefile(s)

fornisce fino a N answer sets

clingo 0 nomefile(s)

li fornisce tutti

clingo --help

per elenco (molte) opzioni

clingo -c n=valore nomefile(s)

specifica il valore della costante n, es. clingo -c n=8 queens.lp 

gringo --text nomefile(s)

fornisce in output il grounding in formato leggibile


Se nei file ci sono direttive di ottimizzazione (minimize o maximize):

clingo nomefile 

trova *una* soluzione ottimale dopo altre non ottimali,
e scrive il valore della misura da ottimizzare (Optimization: ...)

clingo --opt-mode=optN nomefile

trova tutte le soluzioni ottimali (dopo altre non ottimali scrive quelle ottimali rinumerandole) 

