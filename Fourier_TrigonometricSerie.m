% Programa para reconstruir una se�al peri�dica, utilizando la Serie de
% Fourier Trigonom�trica.

clear all
%% ************** Signal's parameters  *****************
A = 5;               % Amplitud de la se�al a reconstruir
To = 2*pi;           % Periodo Fundamental 
wo = (2*pi)/To;      % Frecuencia angular fundamental
N = 1:10;            % Vector de arm�nicos

%%  Fourier coeficients (depends on the interested signal) ***************
ao = A/2;                   % CD component
an = zeros(1,length(N));    % an coeficients, initializing
bn = zeros(1,length(N));    % bn coeficients, initializing

%% ********* Se obtienen los coeficientes an o bn que no valen 0 **********
for n = 1:length(N)         
    an(n) = (2*A/(n*pi)*sin(n*pi/2));
end

%% **Se reconstrute la se�al en el tiempo mediante la serie Trigonom�trica**
h = To/3600;        % Resoluci�n
time = [0:h:To];    % Vector del tiempo

for t = 1:length(time)
    f(t) = ao + sum( an.*cos(N*wo*time(t)) + bn.*sin(N*wo*time(t)) );
end

%% ************** Se grafica el espectro de Frecuencias ********************
figure
stem(N,an);
xlabel('Orden de Arm�nico')
ylabel('Amplitud')
title('Espectro de la Se�al')

%% ***************** Se grafica la se�al en el tiempo **********************
figure
plot(time,f)
xlabel('time [s]')
ylabel('Amplitud')
title ('ft reconstruida')

grid on