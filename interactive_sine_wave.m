function interactive_sine_wave()
    % Crear la figura
    figure('Name', 'Senoidal Interactiva', 'NumberTitle', 'off', 'Position', [100 100 800 600]);
    
    % Crear ejes para la gráfica
    ax = axes('Position', [0.1, 0.4, 0.8, 0.5]);
    t = linspace(0, 2*pi, 1000); % Vector de tiempo
    f = 1; % Frecuencia inicial
    A = 1; % Amplitud inicial
    phi = 0; % Fase inicial
    wave = A * sin(2*pi*f*t + phi); % Onda senoidal inicial
    
    % Graficar la forma de onda
    hPlot = plot(t, wave, 'LineWidth', 2);
    grid on;
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    title('Forma de Onda Senoidal');
    
    % Crear controles interactivos (sliders)
    % Slider para la frecuencia
    uicontrol('Style', 'text', 'Position', [100 50 100 20], 'String', 'Frecuencia (Hz)', 'HorizontalAlignment', 'center');
    freqSlider = uicontrol('Style', 'slider', 'Min', 0.1, 'Max', 10, 'Value', f, ...
                           'Position', [100 30 200 20], ...
                           'Callback', @(src,~) update_plot());
    
    % Slider para la amplitud
    uicontrol('Style', 'text', 'Position', [350 50 100 20], 'String', 'Amplitud', 'HorizontalAlignment', 'center');
    ampSlider = uicontrol('Style', 'slider', 'Min', 0.1, 'Max', 5, 'Value', A, ...
                          'Position', [350 30 200 20], ...
                          'Callback', @(src,~) update_plot());
    
    % Slider para la fase
    uicontrol('Style', 'text', 'Position', [600 50 100 20], 'String', 'Fase (rad)', 'HorizontalAlignment', 'center');
    phaseSlider = uicontrol('Style', 'slider', 'Min', 0, 'Max', 2*pi, 'Value', phi, ...
                            'Position', [600 30 200 20], ...
                            'Callback', @(src,~) update_plot());
    
    % Función para actualizar el gráfico
    function update_plot()
        f = freqSlider.Value; % Obtener frecuencia
        A = ampSlider.Value; % Obtener amplitud
        phi = phaseSlider.Value; % Obtener fase
        wave = A * sin(2*pi*f*t + phi); % Recalcular onda senoidal
        hPlot.YData = wave; % Actualizar datos de la gráfica
        title(ax, sprintf('Forma de Onda Senoidal: Frecuencia = %.2f Hz, Amplitud = %.2f, Fase = %.2f rad', f, A, phi));
    end
end
