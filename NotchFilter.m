%Para el diseño de un filtro Notch

clear

s = tf('s');
fr = 60.9;
wz = 2*pi*fr;
wp = 2*pi*fr;
Q = [0.1 2 4 6 8 10 12 14 16 18 20];
theta = atand(2*Q(6));
alpha = wp/2*Q(6);
Ts = 1.088e-3;

%Para obtener las funciones para cada valor de Q
for i = 1:length(Q)
Hs(i) = (s^2 + wz^2)/(s^2 + (wp/Q(i))*s + wp^2);    
end

% Para mostrar cada una de las FT, para cada Q,  en una sola Gráfica
figure
hold on
%0.1
H1 = bodeplot(Hs(1));
setoptions(H1,'FreqUnits','Hz');
title('Respuesta en Frecuencia del Filtro')
%2
H2 = bodeplot(Hs(2));
setoptions(H2,'FreqUnits','Hz');
title('Respuesta en Frecuencia del Filtro')
%4
H3 = bodeplot(Hs(3));
setoptions(H3,'FreqUnits','Hz');
title('Respuesta en Frecuencia del Filtro')
%6
H4 = bodeplot(Hs(4));
setoptions(H4,'FreqUnits','Hz');
title('Respuesta en Frecuencia del Filtro')
%8
H5 = bodeplot(Hs(5));
setoptions(H5,'FreqUnits','Hz');
title('Respuesta en Frecuencia del Filtro')
%10
H6 = bodeplot(Hs(6));
setoptions(H6,'FreqUnits','Hz');
title('Respuesta en Frecuencia del Filtro')
%12
H7 = bodeplot(Hs(7));
setoptions(H7,'FreqUnits','Hz');
title('Respuesta en Frecuencia del Filtro')
%14
H8 = bodeplot(Hs(8));
setoptions(H8,'FreqUnits','Hz');
title('Respuesta en Frecuencia del Filtro')
%16
H9 = bodeplot(Hs(9));
setoptions(H9,'FreqUnits','Hz');
title('Respuesta en Frecuencia del Filtro')
%18
H10 = bodeplot(Hs(10));
setoptions(H10,'FreqUnits','Hz');
title('Respuesta en Frecuencia del Filtro')
%20
H11 = bodeplot(Hs(11));
setoptions(H11,'FreqUnits','Hz');
title('Respuesta en Frecuencia del Filtro')

%Para Bode Q = 10
figure
Hf = bodeplot(Hs(6));
setoptions(Hf,'FreqUnits','Hz');
title('Respuesta Continua')

%Pars Hz
figure
Hz = c2d(Hs(6),Ts,'tustin');
Gz = bodeplot(Hz);
setoptions(Gz,'FreqUnits','Hz');
title('Respuesta Discreta')

figure 
hold on
step(Hs(6));
step(Hz);
legend('Continua','Discreta')
