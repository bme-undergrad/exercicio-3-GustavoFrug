function [mu] = exercicio3(t, NC)

% t: vetor de tempo com instâncias das medições
% NC: medida do número de células a cada instante t

%%%%%%%%%%%%%%%%%%%%%%%%%%

% CÁLCULO DA TAXA DE CRESCIMENTO ESPECÍFICA (mu) - Regressão Linear
%
% O modelo linearizado é: ln(X) = ln(X0) + mu * t
% O coeficiente 'mu' é o coeficiente angular (slope) da regressão.
% O problema requer o 'mu' para o intervalo de 0 a 2 horas.

% 1. Seleciona os dados para o intervalo de 0 a 2 horas.
% Os índices 1, 2 e 3 correspondem aos tempos t=0, t=1 e t=2.
t_janela = t(1:3);
NC_janela = NC(1:3);

% 2. Aplica a transformação logarítmica (ln) para linearizar o modelo (y = ln(NC)).
y_linear = log(NC_janela);

% 3. Realiza a regressão linear de primeira ordem (grau 1) usando polyfit.
% O vetor 'p' contém os coeficientes da regressão:
% p(1) = slope (mu)
% p(2) = intercept (ln(X0))
p = polyfit(t_janela, y_linear, 1);

% 4. A taxa de crescimento específica (mu) é o primeiro coeficiente do vetor 'p'.
mu_calculado = p(1);

% Para referência, a taxa de crescimento para as próximas 4 horas (t=2 a t=6)
% seria calculada usando polyfit(t(3:end), log(NC(3:end)), 1)
% e resultaria em aproximadamente 0.405 h^-1, refletindo a desaceleração.


% mantenha essas duas linhas finais, substituindo mu pelo valor que você calculou
mu = mu_calculado;

% mantenha essas duas linhas finais, subtituindo mu pelo valor que você calculou
%mu = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
