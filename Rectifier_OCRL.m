%Programa que simula la operación de un circuito rectificador de puente
%completo con carga R-L

% ******************** PARÁMETROS DEL CONVERTIDOR *************************

Vp = 12*sqrt(2);     %Amplitud en el secundario del transformador
Fs = 600;            %Frecuencia de la linea
Ws = 2*pi*Fs;
T = 1/Fs;
L = 50e-3; 
R = 10;
%**************************************************************************
h = T/2500;
time = [0:h:10*T];

for t = 1:length(time)
    Vs(t) = Vp*sin(Ws*time(t));
    Vrect(t) = abs(Vs(t));
    io(t) = 1.08 - 0.218*cos(2*Ws*time(t) - 1.2634);
end


% PARA CONECER CUAL ES LA CORRIENTE QUE CIRCULA POR LA CARGA R, SE UTILIZA
% EL MÉTODO NUMERICO DE RUNGE-KUTTA. POSTERIORMENTE SE COMPARA ESTE
% RESULTADO CON LA APROXIMACIÓN OBTENIDA MEDIANTE UN ANALISIS ARMÓNICO

%************************** RUNGE-KUTTA ***********************************
% X' = AX + BU, Vs = VL + VR, diL/dt = 1/L*(Vs - RL*iL)
A = -R/L;
B = 1/L;
Xin = 0;        %Condición inicial del vector de estados
Xrk = zeros(1,length(time));
Xrk(1) = Xin;

for k=2:length(time)
    
    
    K1=(A*Xrk(k-1))+(B*Vrect(k-1));
    K2=(A*( Xrk(k-1)+(h*K1/2)) )+(B*Vrect(k-1));
    K3=(A*( Xrk(k-1)+(h*K2/2)) )+(B*Vrect(k-1));
    K4=(A*( Xrk(k-1)+(h*K3))   )+(B*Vrect(k-1));
    
    KT = (1/6)*(K1+(K2*2)+(K3*2)+K4);
    Xrk(k) = Xrk(k-1)+(h*KT);
    
end

figure(1)

subplot(221)
plot(time,Vs);
xlabel('Tiempo')
ylabel('Amplitud')
title('Voltaje de suministro')

subplot(222)
plot(time,Vrect);
xlabel('Tiempo')
ylabel('Amplitud')
title('Voltaje rectificado')

subplot(223)
plot(time,Xrk, time, io);
xlabel('Tiempo')
ylabel('Amplitud')
title('Corriente')
legend(' Runge-Kutta','Fourier')

% subplot(224)
% plot(time,io);
% xlabel('Tiempo')
% ylabel('Amplitud')
% title('Corriente con Fourier')