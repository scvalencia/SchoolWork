SIMULATIONS = 100;          % Number of simulations

lerror = zeros(SIMULATIONS, 1);     % Error by Lagrange's method
nerror = zeros(SIMULATIONS, 1);     % Error by Newton-Gregory method

for counter=1:SIMULATIONS
    
    n = randi(10, 1, 1);            % Random dimension
    x = rand(1, n);                 % Random data
    y = rand(1, n);                 % Random data

    lpol = lagrange(x, y);          % Polynomial by Lagrange method
    npol = newton(x, y);            % Polynomial by Newton method

    % Linear system formulation
    [A, sol] = validation(x, y);
    mpol = fliplr(linsolve(A, sol')');

    % Measuring absolute error in each case
    lerror(counter) = norm(lpol - mpol) / norm(mpol);
    nerror(counter) = norm(npol - mpol) / norm(mpol);
end;

axis = 1:SIMULATIONS;
Y = [lerror, nerror];
h = stem(axis, Y);

h(1).Color = 'green';
h(2).Marker = 'square';

xlabel('Simulaciones');
ylabel('Error obtenido');
title('Errores obtenidos en la interpolacion');
legend('Error obtenido en interpolacion de Lagrange', 'Error obtenido en interpolacion de Newton', 'location','southoutside');
set(gcf, 'Position', [400 400 700 700]);
saveas(gcf, 'interpo.png');