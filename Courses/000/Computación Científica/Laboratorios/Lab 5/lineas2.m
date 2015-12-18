function [ Vin_gauss, Vin_jacobi ] = lineas2(n)
    
    % Parámetros generales
    Vs = 1;
    Rs = 10; % Ohm
    Cline = 200e-12; % F/m
    Lline = 0.5e-6; % H/m
    len = 1/n; % m
    f = [1 2 3 5 7 10 20 30 50 70 100]*1e6; % Hz
    Rload = 100; % Ohm
    Lload = 0.2653e-6; % H
    Zload = Rload + 1i*(2*pi*f)*Lload; % Ohm
    
    % Calculo de Impedancia equivalente de Thevenin
    Z1 = 1i*(2*pi*f)*(len*Lline); % Inductiva
    Z2 = 1./(1i*(2*pi*f)*(Cline*len/2)); % Capacitiva
    Zeq = zeros(length(f), 1);
    
    for i=1 : length(f)
        Zeq(i) = paralelo(Zload(i), Z2(i));
        for j=1 : n
            Zeq(i) = paralelo((Zeq(i) + Z1(i)), Z2(i));
            if j ~= n
                Zeq(i) = paralelo(Zeq(i), Z2(i));
            end
        end
    end
    
    Vin_gauss = gauss_seidel(diag((Zeq+Rs)./Zeq), ones(11,1)*Vs, ones(11,1), 100, 0.00001);
    Vin_jacobi = jacobi(diag((Zeq+Rs)./Zeq), ones(11,1)*Vs, ones(11,1), 100, 0.00001);
end