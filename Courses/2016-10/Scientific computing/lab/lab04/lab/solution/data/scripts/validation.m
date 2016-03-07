residuals = zeros(6, 6);
sizes = [5 20 50 75 100 500];

% JACOBI
for i=1:6
    sz = sizes(i);
    [A b] = gensystem(sz);
    [k x] = jacobi(A, b, zeros(sz, 1));
    residual = norm(b - A * x);
    residuals(1, i) = residual;
end;
    
% GAUSS-SEIDEL
for i=1:6
    sz = sizes(i);
    [A b] = gensystem(sz);
    [k x] = gaussseidel(A, b, zeros(sz, 1));
    residual = norm(b - A * x);
    residuals(2, i) = residual;
end;

% RREF
for i=1:6
    sz = sizes(i);
    [A b] = gensystem(sz);
    augmented = [A b];
    x = rref(augmented);
    x = x(:, end);
    residual = norm(b - A * x);
    residuals(3, i) = residual;
end;

% INV
for i=1:6
    sz = sizes(i);
    [A b] = gensystem(sz);
    x = inv(A) * b;
    residual = norm(b - A * x);
    residuals(4, i) = residual;
end;

% LINSOLVE
for i=1:6
    sz = sizes(i);
    [A b] = gensystem(sz);
    x = linsolve(A, b);
    residual = norm(b - A * x);
    residuals(5, i) = residual;
end;

% MLDIVIDE
for i=1:6
    sz = sizes(i);
    [A b] = gensystem(sz);
    x = A\b;
    residual = norm(b - A * x);
    residuals(6, i) = residual;
end;

plotter(residuals, parula);
set(gcf, 'Position', [400 400 700 700]);
saveas(gcf, '../img/comparisson.png');