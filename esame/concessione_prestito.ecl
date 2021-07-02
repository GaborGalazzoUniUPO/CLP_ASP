:- lib(clpr).



incomev(LoanAmount, /*  importo del prestito */
        LoanTerm, /* durata (in mesi) del prestito */
        MonthlyIncome, /* introito mensile del potenziale cliente */
        MonthlyDebth, /*quanto mensilmente paga il potenziale cliente per ripagare prestiti già contratti (es. mutuo); supponiamo rimanga invariata durante il LoanTerm*/
        Result /* esito della verifica, ok/no */):-
        {
          TotalIncome = LoanTerm * MonthlyIncome, /* introito totale previsto del potenziale cliente durante la durata del prestito */
          TotalDebt = LoanTerm * MonthlyDebth, /* debito da ripagare (per altri prestiti contratti in precedenza) durante la durata di questo prestito */
          AccumulatedDebt = TotalDebt + LoanAmount /* uanto si prevede che il potenziale cliente dovrà ripagare nel periodo del prestito: TotalDebt + Loan Amount */
        },
        {TotalIncome>AccumulatedDebt} -> Result = true; Result = false
        .
% incomev(LoanAmount,LoanTerm,MonthlyIncome,MonthlyDebth,Result)

% incomev(30000,24,2000,500,Result)
% incomev(LoanAmount,24,2000,500,true)
% incomev(40000,T,2000,500,true)

%
% Standard mortgage relationship between:
%     P: Principal 	(ammontare del prestito)
%     T: Life of loan in months   
%     I: Fixed (but compounded) monthly interest rate 
%     B: Outstanding balance at the end    (eventuale saldo finale)
%     M: Monthly payment		   (rata mensile)

/* se dura 1 mese, pagare alla fine P + P*I - MP */

mg(P, T, I, B, MP) :-
  {
    T = 1,
    B = P + P*I - MP
  }.

/* se dura piu' di un mese, e' come un prestito di T1=T-1 mesi,
   con interesse I, saldo B, rata MP e importo P(I+1) - MP,
   infatti P*(I+1) e' la cifra dovuta con gli interessi,
   a cui si sottrae una rata */

mg(P, T, I, B, MP) :-
  {T > 1, P1 = P*(I+1) - MP, T1 = T-1},
  mg(P1,T1,I,B,MP).


incomeval(
          Principal, /*  importo del prestito */
          LoanTerm, /* durata (in mesi) del prestito */
          MonthlyIncome, /* introito mensile del potenziale cliente */
          MonthlyDebth, /*quanto mensilmente paga il potenziale cliente per ripagare prestiti già contratti (es. mutuo); supponiamo rimanga invariata durante il LoanTerm*/
          Interest, /* tasso di interesse */
          MonthlyPayment, /* importo mensile della rata */
          Result /* esito della verifica, ok/no */):-
          mg(Principal,LoanTerm,Interest,0,MonthlyPayment),
          {
            TotalIncome = LoanTerm * MonthlyIncome, /* introito totale previsto del potenziale cliente durante la durata del prestito */
            TotalDebt = LoanTerm * MonthlyDebth, /* debito da ripagare (per altri prestiti contratti in precedenza) durante la durata di questo prestito */
            TotalRepayment = LoanTerm * MonthlyPayment,
            AccumulatedDebt = TotalDebt + TotalRepayment /* uanto si prevede che il potenziale cliente dovrà ripagare nel periodo del prestito: TotalDebt + Loan Amount */
          },
          {TotalIncome>AccumulatedDebt} -> Result = true; Result = false

% incomeval(30000,24,2000,500,0.01,M,true)
% incomeval(Principal,24,2000,500,0.01,_,true)
% incomeval(40000,LoanTerm,2000,500,0.01,_,true)
       