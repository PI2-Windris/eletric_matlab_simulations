% Codigo para definir os valores para o dcdc

% Tentaremos encontrar um bom conversor a partir da variacao do ripple

% Assumimos que a variacao de entrada eh entre 10 e 45V
% A tensao de saida deve ser de pelo menos 50V

%% Primeiro caso 10V

V_i = 8;
V_o = 50;
I_o = 3;
f = 50e3;

% Determinamos o duty cicle

D = 1- V_i/V_o

% A corrente media no indutor eh dada por 

I_L = V_o*I_o/V_i

% Considerando uma variacao de corrente de 1%, temos

delta_IL = (1/100)*I_L;

% Portanto

L = V_i*D/(delta_IL*f)

%% Segundo caso 45V

V_i = 45;
I_o = 3;

% Determinamos o duty

D = 1-V_i/V_o

% A corrente no indutor entao eh 

I_L = V_o*I_o/V_i;

% O ripple entao eh dado por

delta_IL = (2/100)*I_L;

% Portanto 

L = V_i*D/(delta_IL*f)