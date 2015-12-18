function [ Vth, Zth ] = lineas(n)
    
    syms Vs Vth;
    % Parámetros generales
    Rs = 10; % Ohm
    Cline = 200e-12; % F/m
    Lline = 0.5e-6; % H/m
    len = 1/n; % m
    f = [1 2 3 5 7 10 20 30 50 70 100]*1e6; % Hz
    
    % Calculo de Impedancia equivalente de Thevenin
    Z1 = 1i*(2*pi*f)*(len*Lline); % Inductiva
    Z2 = 1./(1i*(2*pi*f)*(Cline*len/2)); % Capacitiva
    Zth = zeros(length(f), 1);
    
    for i=1 : length(f)
        Zth(i) = paralelo(Rs, Z2(i));
        for j=1 : n
            Zth(i) = paralelo((Zth(i) + Z1(i)), Z2(i));
            if j ~= n
                Zth(i) = paralelo(Zth(i), Z2(i));
            end
        end
    end
    
    % Calculo de Voltaje de Thevenin
    Vth = Vs*(Rs./(Rs + Z2));
    for i=1 : n
        if i == n
            q = 1;
        else
            q = 0.5;
        end
        Vth = Vth.*(q*Z2./(Z1 + q*Z2));
    end
    
end