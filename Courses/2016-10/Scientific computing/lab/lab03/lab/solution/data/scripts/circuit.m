% Matrix and vector for the circuit dispplayed above
A = [4000 -3000 0 0 0 ; -3000 14000 -5000 -6000 0 ; 0 0 1 0 -1 ; 0 -5000 11000 -7000 7000 ; 0 -6000 0 13000 -7000];
b = [-1 9 0.012 0 0];

% Allocating resources for solutions by each method
solutions = zeros(5, 5);

% Apply GE, and back substitution to find the required vector
[At, bt] = gaussian_elimination(A, b);
solutions(1,:) = back_substitution(At, bt);

% Apply A^(-1) * b' to find the required vector
solutions(2,:) = inv(A) * b';

% Apply linsolve to find the required vector
solutions(3,:) = linsolve(A, b');

% Apply mldivide to find the required vector
solutions(4,:) = A\b';

% Apply rref to find the required vector
augmented = [A b'];
solution = rref(augmented);
solutions(5,:) = solution(:, 6);

plotter(solutions, parula);
set(gcf, 'Position', [400 400 700 700]);
saveas(gcf, '../img/plot_circuit_solution.png');