% Usage: X = back_substitution(A, b)
% Back substitution for solving a linear system. A is an n x n
% nonsingular upper triangular, and b is a vector of size n.
%
% Input:
% A - an n x n nonsingular UT matrix
% b - a real valued n-size vector
%
% Output:
% X - a vector that satisfies (under perturbation restictions due 
% to limitations), the equation A * X = b
%
% Examples:
% A = [5 2 3 ; 0 2 1 ; 0 0 4];
% b = [4 3 1];
% X = back_substitution(A, b)

function X = back_substitution(A, b)

    n = size(A, 2);                                            
    X = zeros(n, 1);
    X(n) = b(n) / A(n, n);
    
    for k=n-1:-1:1
        % Computing x(k) using the expression displayed in
        % the deduction of the algorithm. 
        % A(k, k + 1:n) * X(k + 1:n) could be seen as 
        % sum(j = k + 1, n, A(k, j) * X(j)
        X(k) = (b(k) - A(k, k + 1:n) * X(k + 1:n))/A(k, k);
    end;
end