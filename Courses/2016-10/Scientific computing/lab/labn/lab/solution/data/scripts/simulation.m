format long;

% Get the last number which makes the Hilbert matrix nonsingular,
% that is, the n sich that for all i < n Hilbert(i) is nonsingular
% seen as a computer with finite representation capabiblities.
% upper_bound, holds this value

i = 1;
while 1
    try
        [A, b, x] = validate(i);        
    catch
        break;
    end;     
    i = i +1;
end;

upper_bound = i;

% The partial errors for each value i = 1 ... (upper_bound - 1)
partial_errors = zeros(upper_bound - 1, 1);

% Execute validate for each i = 1 ... (upper_bound - 1), getting the
% Hilbert matrix of order i, the associated vector of the same order, and
% the x that numerically satisfies A * x = b, from the point of view of
% gaussian elimination and backward substitution, as seen by validate().
% Get the error assocaited with each calculation.
for i=1:upper_bound - 1
    % The algebraic solution
    excsolution = (1:i)';
    % The matrix, the vector and the numeric solution
    [A, b, numsolution] = validate(i);
    % Computing the relative error
    rel = norm(A*b - numsolution) / norm(excsolution);
    partial_errors(i) = rel;
end;

axis = 1:upper_bound - 1;

stem(axis, partial_errors, 'filled');
set(gcf, 'Position', [400 400 700 700]);
saveas(gcf, '../img/error.png');