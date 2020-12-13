NMC=300000;
% NMC è il numero di estrazioni di una variabile aleatoria normale standard
 
z1 = randn(NMC/2,1);
z2 = -z1;
z = [z1;z2];
g = r-qdiv-0.5*sig*sig;
fattoredisconto = exp(-r*(T-t0));
 
%simuliamo il sottostante a scadenza
S = S0*exp(g*(T-t0) + sig*sqrt(T-t0)*z);
%simuliamo per una CALL
payoff = max(S-E,0);
 
% calcola la media ARITMETICA scontata del payoff.
 
AC = fattoredisconto*mean(payoff);

errorecon300000estrazioni = abs(AC-Ctrue);

% TESTA LA CONVERGENZA----------------------------------------------------
 
for i=1:1:NMC
vetAC(i) = fattoredisconto*mean(payoff(1:i));
vetn(i) = i;
end
 
%plot per disegnare i due vettori nel ciclo for 
plot(vetn,vetAC);
%grid per fare una griglia
grid
 
hold on;
%Ctrue è una retta orizz. perchè non dipende dalle NMC perchè è un numero
plot(vetn, 0*vetn + Ctrue,'r');
 
%etichette nel grafico
xlabel('numero di estrazioni');
ylabel('AC');


 
errore = vetAC - Ctrue;
 
s_Ant = var(vetAC);  % Varianza dello stimatore MC
  
figure(2)
 
plot(vetn,errore);
 
grid
 
xlabel('numero di estrazioni');
ylabel('errore');
 
 
disp('varianza dello stimatore Monte Carlo'); disp(s_Ant)
