function [w1,w2,Error]=BackPropagation(In_Set,Target_Set,Learning_Rate,w1,w2,Epocas)
%% Realiza el entrenamiento de la red.
    %Entrada:
        % In_Set = datos de entrada.
        % Target_Set = resultado deseado.
        % Matrices de peso (salen de "create").
    %Salida:
        %Matrices de pesos entrenadas.
        %Error correspondiente al set de entrenamiento.
%%

    Error_Vector=[]; %Vector de error de entrenamiento por epoca.
    
for t=1:Epocas %Itero en la cantidad de epocas.
        
    Error_Total=0; %Error total para una epoca
 
for h=randperm(length(In_Set(1,:)))
                %Itero sobre el set de entren.
            
            [w1,w2,Error]=Correction(In_Set(:,h),Target_Set(h),Learning_Rate,w1,w2);
                %Entrenamiento para una entrada.
            
            Error_Total = Error_Total + Error;
                            
end
        
        Error_Vector = [Error_Vector,Error_Total]; 
                %Acumulo errores
        
end
    
    Error = Error_Total; %Error del ultimo entrenamiento.
    plot(1:size(Error_Vector,2),Error_Vector,'d') %Evolucion del error.
    title('Evolucion del error')
    xlabel('iteracion'); ylabel('Error');grid on
   
end