% This programm is used to analyze the averaged model of a buck converter
clear all
%%  BUCK PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vin = 12;
iz = 0;
R = 5;                                                     
C = 5e-6;                                                              
L = 291e-6;  
h = 10e-6;
Vo = 5;  %Desired voltage output
D = Vo/Vin;
%% STATE SPACE MATRICES %%%%%%%%%%%%%%%%%%%%
A1  = [0 -1/L ; 1/C (-1/(R*C))];                                        
B1  = [1/L 0;0 1/C];   

A2 = A1;                                                                
B2 = [0 0; 0 1/C];                                                        
                                                                                                                                         %
Ap = A1*D + A2*(1-D); %Averaged Matrices
Bp = B1*D + B2*(1-D); %Averaged Matrices
%% RUNGE KUTA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:h:5e-3; %Vector Time
Xed=[0;0];     %Initial conditions

Xrk=Xed;
U=[Vin; iz];
 
    for k=2:length(time)
     K1=(Ap*Xrk(:,k-1))+(Bp*U);
     K2=(Ap*(Xrk(:,k-1)+(h*K1/2)))+(Bp*U);
     K3=(Ap*(Xrk(:,k-1)+(h*K2/2)))+(Bp*U);
     K4=(Ap*(Xrk(:,k-1)+(h*K3)))+(Bp*U);
     
     KT = (1/6)*(K1+(K2*2)+(K3*2)+K4);
     Xrk(:,k) = Xrk(:,k-1)+(h*KT); 
    end



%% To visualize V_out and Inductor current 
plot(time,Xrk)
grid on;
legend('Inductor Current','Vo');