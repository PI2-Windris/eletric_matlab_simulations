%% Calculos para o conversor dc dc buck

% Calculamos uma tensao de saida de 15V quando estivermos no maximo


% Dessa forma, temos 

Vo = 12;
Vi = 30;

D = Vo/Vi;

% Adotamos uma frequência de 100Khz

f = 30e3;
T = 1/f;

R = 10;        % Resistência inicial para teste

% A corrente consumida será 

I_L = Vo/R;

%Determinamos um valor minimo para o indutor
% Com base na variacao de corrente

delta_L = 0.4*I_L;

% Com isso, temos um valor de indutância de

L = (Vi - Vo)*D/(delta_L*f)


I_max = I_L + delta_L/2;

I_min = I_L - delta_L/2;

% Com isso, calculamos o valor de corrente rms

I_rms = sqrt(I_L^2 + ((delta_L/2)/sqrt(3))^2);

% Atribuimos um limite de ripple de 1% na saida

delta_V = Vo*0.01;

% Por fim, encotramos o valor do capacitor

C = (1-D)/(8*L*(delta_V/Vo)*f^2);

% Os valores dos componentes são 

sprintf('L = %.3e H', L)
sprintf('C = %.3e F', C)
sprintf('f = %g Hz', f)
sprintf('Duty = %.1f', D)



%% Calculo para o conversor DC DC Boost

% Primariamente, o conversor DC DC bost será mais para a simulacao
% Provavelmente o sistema utilizara um conversor Buck, calculado acima

R = 10; % Consideramos um resistor de 10 ohms para o teste 

% Para atingirmos o total de potência com esse resistor, temos que

Vi = 15;

Vo = sqrt(100*R);

% Com isso temos um duty cicle de

D = 1 - Vi/Vo;

% Escolhemos o indutor de forma que o ripple na corrente seja controlavel

% Temos que a corrente média no indutor eh 

Io = Vo/R;

I_L = Vo*Io/Vi;

% A variação da corrente no indutor deve ser de no maximo 20%

delta_L = 0.2*I_L;

% Com isso eh possivel determinar a indutancia 

L = Vi*D/(delta_L*f);

% Acrescendo o valor em pelo menos 20%, temos

L = L*1.2

% O ripple da tensao deve ser de pelo menos 5% do valor

delta_Vo = 0.01*Vo;

% Com isso temos uma capacitancia de saida de 

C = D/(R*delta_Vo*f)












