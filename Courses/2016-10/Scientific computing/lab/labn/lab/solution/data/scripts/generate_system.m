% Usage: [A, b] = generate_system(n) or A = generate_system(n)
% Generates the n order Hilbert matrix, and a vector whose i-th
% position is given by summation(k = 1, n, k / (i + k - 1)
%
% Input:
% n - the size of the required matrix
%
% Output:
% A - The Hilbert matrix of order n
% b - A real valued n order vector, whose values are specified in the
% header
%
% Examples:
% [A, b] = generate_system(70)
% [A, b] = generate_system(232)

function [A, b] = generate_system(n)

    % Preallocating a matrix with zeros(), reduces memory management
    % overhead
    A = zeros(n, n);
    b = zeros(n, 1);
    
    for i = 1:n
        summation = 0;
        for j = 1:n
            summation = summation + j / (i + j - 1);
            A(i, j) = 1 / (i + j - 1);
        end;
        b(i) = summation;
    end;
    
end