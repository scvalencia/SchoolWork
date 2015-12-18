clc; clear all; close all;
%% Validaci�n
    dimensiones = [3 5 7 9 10 13 20 50];
    
    % Definici�n de colores para gr�ficas
    cc = hsv(50);
    figure;
    
    for i = dimensiones
        [A, b] = generar(i);
        A = single(A);
        b = single(b);
        % Soluci�n con m�todo de matlab
        x_matlab = A\b;
        % Soluci�n con algoritmo de eliminaci�n gaussiana y sustituci�n
        %   hacia atr�s
        [AA, bb] = gaussian_elimination(A,b);
        x_gauss = back_sustitution(AA,bb);
        % Soluci�n real
        x_real = 1:i;
        
        error_matlab = abs(x_matlab - x_real')./abs(x_real');
        error_gauss = abs(x_gauss - x_real')./abs(x_real');
        
        % Gr�fica error con m�todo de matlab en funci�n de la dimensi�n del
        % sistema
        subplot(2,1,1); hold on;
        plot(error_matlab, 'color', cc(i,:), 'DisplayName', sprintf('Dimensi�n %d', i));
        % Gr�fica error con m�todo de gauss en funci�n de la dimensi�n del
        % sistema
        subplot(2,1,2); hold on;
        plot(error_gauss, 'color', cc(i,:), 'DisplayName', sprintf('Dimensi�n %d', i));
    end
    % Detalles primera gr�fica
        subplot(2,1,1); legend('show');
        title('Error relativo - M�todo de matlab');
        xlabel('n'); ylabel('error');
    % Detalles segunda gr�fica
        subplot(2,1,2); legend('show');
        title('Error relativo - M�todo de Gauss');
        xlabel('n'); ylabel('error');
        
%% Aplicaci�n

    R = (1:7)*1000; % Vector con valores de resistencias
    Va = 9;
    Vb = 8;
    Ic = 12E-3;
    
    % Sistema de ecuaciones lineales Ax = b

    A = [(-1/R(1)-1/R(4)-1/R(6)-1/R(7)) (1/R(6)+1/R(7)) (-1/R(3))               1/R(4)          ;
         (1/R(6)+1/R(7))                0               (-1/R(5)-1/R(6)-1/R(7)) 0               ;
         (1/R(4))                       0               0                       (-1/R(2)-1/R(4));
         1                              0               -1                      0               ];
    
    b = [(-Ic-Vb/R(1)); Ic; 0; Va];
    x = A\b;
    VA = x(1); 
    VC = x(2);
    VF = x(3);
    VE = x(4);
    i1 = (VA - Vb)/R(1);
    i2 = -VE/R(2);
    i3 = VF/R(3);
    i4 = (VA - VE)/R(4);
    i5 = VC/R(5);
    i6 = (VA - VC)/R(6);
    i7 = (VA - VC)/R(7);
    
    % Comprobaci�n con m�todos de Matlab
    [X, jb] = rref(A);
    fprintf('\nLa matriz es de rango %d\n', length(jb));
    x_m1 = inv(A)*b;
    x_m2 = linsolve(A,b);
    x_m3 = A\b;
    
    % Comprobaci�n con algoritmo de eleminaci�n de Gauss con pivoteo
    % parcial
    
    [AA, bb] = gaussian_elimination(A,b);
    x_gauss = back_sustitution(AA,bb);
