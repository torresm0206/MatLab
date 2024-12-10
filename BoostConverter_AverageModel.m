% This programm is used to analyze the averaged model of a Boost converter
clear all
%% Defing Parameters
Vin = 12;
Vo = 24;
R = 24;
L = 1e-3;
C = 100e-6;
D = 1 - Vin/Vo;
%% State Space Matrices
A1 = [0 0; 0 -1/(R*C)];
B1 = [1/L ; 0];

A2 = [0 -1/L ; 1/C -1/(R*C)];
B2 = [1/L ; 0];

Ap = A1*D + A2*(1-D); %Averaged Matrices
Bp = B1*D + B2*(1-D); %Averaged Matrices

%% Applying Runhe Kute to solve
h = 10e-6;
time=0:h:100e-3; %Vector Time
Xed=[0;0];     %Initial conditions

Xrk=Xed;
U=[Vin];
 
    for k=2:length(time)
     K1=(Ap*Xrk(:,k-1))+(Bp*U);
     K2=(Ap*(Xrk(:,k-1)+(h*K1/2)))+(Bp*U);
     K3=(Ap*(Xrk(:,k-1)+(h*K2/2)))+(Bp*U);
     K4=(Ap*(Xrk(:,k-1)+(h*K3)))+(Bp*U);
     
     KT = (1/6)*(K1+(K2*2)+(K3*2)+K4);
     Xrk(:,k) = Xrk(:,k-1)+(h*KT); 
    end
%% Graphics for Inductor and Output Voltage
plot(time,Xrk)
grid on;
legend('Inductor Current','Vo')