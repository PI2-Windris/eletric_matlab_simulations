% Programa para realizar o calculo de capacidade da bateria

%% Designacao do consumo

Vbat = 12;

% Consideramos um valor de consumo de 200W

P_cons = 100;       %W

% Se considerarmos esse consumo durante todo um dia ininterruptamente,

Pdia = P_cons*24;  %Wh/dia



% Considerando que precisamos de uma bateria para manter o periodo da noite
% e que o periodo da noite gera uma quantidade de energia quase nula, temos
% um consumo de corrente a 12V de

Pnoite = P_cons*12; %Wh/noite

Inoite = Pnoite/Vbat;   %Ah/noite

% Entao, para suprirmos uma carga de 200W durante toda a noite, precisamos 
% de uma bateria de no mínimo 200Ah


