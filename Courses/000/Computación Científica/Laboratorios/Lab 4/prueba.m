
A = generateTridiagonal(10);
b = ones(10,1);

%% Factorización LU
[L, U] = factorizacionLU(A);
y = L\b;
xLU = U\y;

%% Factorización de Cholesky
G = factorizacionCholesky(A);
y = G\b;
xG = G'\y;

%% Análisis de algoritmos
n = 10:2:100;
timeLU = zeros(length(n),1);
i = 1;
for j = n
    b = ones(j,1);
    tic;
        [L, U] = factorizacionLU(generateTridiagonal(j));
        y = L\b;
        xLU = U\y;
    timeLU(i) = toc;
    i = i + 1;
end
subplot(1,2,1); plot(n, timeLU, 'ko', 'LineWidth', 2);
title('Factorización LU');
ylabel('Tiempo [s]'); xlabel('Dimensión N');

timeG = zeros(length(n),1);
i = 1;
for j = n
    b = ones(j,1);
    tic;
        G = factorizacionCholesky(generateTridiagonal(j));
        y = G\b;
        xLU = G'\y;
    timeG(i) = toc;
    i = i + 1;
end
subplot(1,2,2); plot(n, timeG,'ko', 'LineWidth', 2);
title('Factorización Cholesky');
ylabel('Tiempo [s]'); xlabel('Dimensión N');

figure; hold on;
plot(n, timeLU,'r', 'LineWidth', 2, 'DisplayName', 'LU');
plot(n, timeG,'b', 'LineWidth', 2, 'DisplayName', 'Cholesky');
title('Tiempo de ejecución');
xlabel('Dimensión N'); ylabel('Tiempo [s]');
legend('show');