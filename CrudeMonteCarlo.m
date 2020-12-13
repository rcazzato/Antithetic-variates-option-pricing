NMC=300000;
% NMC è il numero di estrazioni di una variabile aleatoria normale standard

z = randn(NMC,1);
g = r-qdiv-0.5*sig*sig;
fattoredisconto = exp(-r*(T-t0));

S = S0*exp(g*(T-t0) + sig*sqrt(T-t0)*z);
payoff = max(S-E,0);

% calcola la media ARITMETICA scontata del payoff.

C = fattoredisconto*mean(payoff);

% valuta l'errore rispetto alla soluzione analitica del modello di BS

errore300000estrazioni = abs(C-Ctrue);


% TESTA LA CONVERGENZA----------------------------------------------------
 
for i=1:1:NMC
vetC(i) = fattoredisconto*mean(payoff(1:i));
vetn(i) = i;
end
 
%plot per disegnare i due vettori nel ciclo for 
plot(vetn,vetC);
%grid per fare una griglia
grid
 
hold on;
%Ctrue è una retta orizz. perchè non dipende dalle NMC perchè è un numero
plot(vetn, 0*vetn + Ctrue,'r');
 
%etichette nel grafico
xlabel('numero di estrazioni');
ylabel('C');

 
errore = vetC - Ctrue;
 
s = var(vetC);  % Varianza dello stimatore MC

figure(2)
 
plot(vetn,errore);
 
grid
 
xlabel('numero di estrazioni');
ylabel('errore');
 
 
disp('Varianza dello stimatore Monte Carlo'); disp(s)
