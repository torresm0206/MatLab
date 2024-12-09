% Programa para reconstruir una señal periódica, utilizando la Serie de
% Fourier Trigonométrica.

clear all
%% ************** Signal's parameters  *****************
A = 5;               % Amplitud de la señal a reconstruir
To = 2*pi;           % Periodo Fundamental 
wo = (2*pi)/To;      % Frecuencia angular fundamental
N = 1:10;            % Vector de armónicos

%%  Fourier coeficients (depends on the interested signal) ***************
ao = A/2;                   % CD component
an = zeros(1,length(N));    % an coeficients, initializing
bn = zeros(1,length(N));    % bn coeficients, initializing

%% ********* Se obtienen los coeficientes an o bn que no valen 0 **********
for n = 1:length(N)         
    an(n) = (2*A/(n*pi)*sin(n*pi/2));
end

%% **Se reconstrute la señal en el tiempo mediante la serie Trigonométrica**
h = To/3600;        % Resolución
time = [0:h:To];    % Vector del tiempo

for t = 1:length(time)
    f(t) = ao + sum( an.*cos(N*wo*time(t)) + bn.*sin(N*wo*time(t)) );
end

%% ************** Se grafica el espectro de Frecuencias ********************
figure
stem(N,an);
xlabel('Orden de Armónico')
ylabel('Amplitud')
title('Espectro de la Señal')

%% ***************** Se grafica la señal en el tiempo **********************
figure
plot(time,f)
xlabel('time [s]')
ylabel('Amplitud')
title ('ft reconstruida')

grid on