% Parámetros del circuito
R = 1000; % Resistencia de entrada (ohms)
R2 = 2000; % Resistencia de realimentación (ohms)
C = 1e-6; % Capacitancia (faradios)

% Coeficientes de la función de transferencia
numerador = [-1]; % Numerador de la función de transferencia
denominador = [R*C, R/R2]; % Denominador de la función de transferencia

% Crear el sistema
H = tf(numerador, denominador);

% Graficar el diagrama de Bode
bode(H);
grid on;
title('Diagrama de Bode del Filtro Pasa-Bajas Activo');

% hold on;
% w_c = sqrt(2 - (R/R2)^2)/(R*C)
% disp(['Frecuencia de corte aproximada (Hz): ', num2str(w_c)]);
% 
% %Gráfica de Lugar geométrico
% figure;
% rlocus(H);
% grid on;
% title('Lugar Geométrico de las Raíces')