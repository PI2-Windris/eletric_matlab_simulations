% Código para algoritmo MPPT pertubation and observation
% para o painel fotovoltaico.

function Duty = MPPT_solar_panel(Vpv, Ipv)


    %% Declaramos as variaveis do tipo persistent de forma que os valores 
    % fiquem armazenados mesmo com o término da função
    
    persistent Vpv_old Ppv_old Duty_old
    
    % Inicializacao das variaveis
    if isempty(Duty_old)
       Duty_old = 0.5;
       Ppv_old = 140;
       Vpv_old = 20;
    end
    
    Duty_var = 0.001;           % Delta de variacao a cada iteracao
    
    
    % Calculo do valor de potencia
    
    Ppv = Vpv * Ipv;
    
    %% Inicializacao da comparacao
    
    if ((Ppv - Ppv_old) ~= 0)
       if ((Ppv - Ppv_old) > 0) 
            if ((Vpv - Vpv_old) > 0)
                Duty = Duty_old - Duty_var;
            else 
                Duty = Duty_old + Duty_var;
            end
       else 
           if ((Vpv - Vpv_old) > 0)
                Duty = Duty_old + Duty_var;
           else 
               Duty = Duty_old + Duty_var;
           end
       end
       
       Duty_old = Duty;
       
    end
end


