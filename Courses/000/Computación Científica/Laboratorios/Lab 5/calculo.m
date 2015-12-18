n = [1 2 3 5 7 10 15];

Vs = 1;
Rload = 100; % Ohm
Lload = 0.2653e-6; % H
f = [1 2 3 5 7 10 20 30 50 70 100]'*1e6; % Hz
Zload = Rload + 1i*(2*pi*f)*Lload; % Ohm
Vload_gauss = zeros(length(n),length(f));
Vload_jacobi = zeros(length(n),length(f));
Vin_gauss = zeros(length(n),length(f));
Vin_jacobi = zeros(length(n),length(f));

for i = n
   [b, Zth] = lineas(i); % b = Vth
   b = double(subs(b, Vs))';
   A = diag((Zth + Zload)./Zth);
   % Vload 
   Vload_gauss(i,:) = gauss_seidel(A, b, ones(11,1)*Vs, 1000, 0.00001)';
   Vload_jacobi(i,:) = jacobi(A, b, ones(11,1)*Vs, 1000, 0.00001)';
   % Vin
   [ Vin_gauss(i,:), Vin_jacobi(i,:) ] = lineas2(i);
end

%% Gr�ficas Vload

cc = hsv(length(n));
figure; hold on;
for i=1 : length(n)
    semilogx(f, log10(abs(Vload_jacobi(i,:))), 'color', cc(i,:), 'DisplayName', strcat('\pi',sprintf('%d', n(i))));
end
title('Voltaje en la carga - Jacobi');
xlabel('Frecuencia [Hz]');
ylabel('Log_{10}(V_{carga}) [-]');
legend('show');

figure; hold on;
for i=1 : length(n)
    semilogx(f, log10(abs(Vload_gauss(i,:))), 'color', cc(i,:), 'DisplayName', strcat('\pi',sprintf('%d', n(i))));
end
title('Voltaje en la carga - Gauss Seidel');
xlabel('Frecuencia [Hz]');
ylabel('Log_{10}(V_{carga}) [-]');
legend('show');

%% Gr�ficas Vin

figure; hold on;
for i=1 : length(n)
    semilogx(f, log10(abs(Vin_jacobi(i,:))), 'color', cc(i,:), 'DisplayName', strcat('\pi',sprintf('%d', n(i))));
end
title('Voltaje en la entrada - Jacobi');
xlabel('Frecuencia [Hz]');
ylabel('Log_{10}(V_{carga}) [-]');
legend('show');

figure; hold on;
for i=1 : length(n)
    semilogx(f, log10(abs(Vin_gauss(i,:))), 'color', cc(i,:), 'DisplayName', strcat('\pi',sprintf('%d', n(i))));
end
title('Voltaje en la entrada - Gauss Seidel');
xlabel('Frecuencia [Hz]');
ylabel('Log_{10}(V_{carga}) [-]');
legend('show');