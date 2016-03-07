% Usage: [Ar, br] = gaussian_elimination(A, b) or Ar = gaussian_elimination(A, b)
% Gaussian elimination with partial pivoting for a linear system given
% the matrix A and the vector b. It returns the trasfomed version of
% each argument. A is of size n x n, and b of size n
%
% Input:
% A - an n x n nonsingular real valued matrix
% b - a real valued n-size vector
%
% Output:
% Ar - The transformed version of A after the elimination with such
% strategy
% br - The transformed version of the vector b after the elimination with 
% such partial pivoting strategy
%
% Examples:
% A = [5 2 3 ; 0 2 1 ; 0 0 4];
% b = [4 3 1];
% [Ar, br] = gaussian_elimination(A, b)

function [Ar, br] = gaussian_elimination(A, b)

    n = size(A, 2);
    for j=1:n-1
        % We pick the pivot by selecting the biggest element per column
        [pivot, k] = max(abs(A(j:n, j)));

        % Since a pivot, is diag(A), if such value is near to zero, the
        % matrix should be treated as singular, throw an error if so
        if(pivot <= eps)
            error('Matrix is singular');
        end;

        % Swap the required rows of the matrix j with k + j - 1
        temp = A(j, :);
        A(j, :) = A(k + j - 1,:);
        A(k + j - 1, :) = temp;

        temp = b(j);
        b(j) = b(k + j - 1);
        b(k + j - 1) = temp;

        % Apply the multipliers with each required item in the row
        for i=j+1:n
            mult=A(i, j)/A(j, j);
            A(i, j:n) = A(i, j:n) - mult*A(j, j:n);
            b(i) = b(i) - mult*b(j);
        end;
    end;
    
    Ar = A;
    br = b;
end