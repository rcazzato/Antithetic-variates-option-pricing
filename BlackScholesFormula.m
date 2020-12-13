% CALCOLA IL PREZZO DI UNA CALL VANIGLIA
% r: TASSO DI INTERESSE
% sig: VOLATILITA'
% qdiv: RATEO DI DIVIDENDO
% T: SCADENZA
% t0: DATA DI VALUTAZIONE (INIZIALE)
% E: STRIKE
% S0: PREZZO DEL SOTTOSTANTE AL TEMPO t0 

d1 = log(S0/E) + (r - qdiv + 0.5d0*sig*sig)*(T-t0)/(sig*sqrt(T-t0));
d2 = d1 - (sig*sqrt(T-t0));

n1 = normcdf(d1);
n2 = normcdf(d2);

Ctrue = S0*n1*exp(-qdiv*(T-t0)) - E*(exp(-r*(T-t0)))*n2;


