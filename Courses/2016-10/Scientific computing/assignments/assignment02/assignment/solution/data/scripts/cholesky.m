function L = cholesky(A)
% given a matrix, it tries hard to find the Cholesky decomposition of a
% matrix, iff the matrix is positive definite, otherwise, it fails and
% return an error. 

%   Arguments:
%       A: a square matrix

%   USAGE:
%   L = cholesky(A);
%   assert L' * L = A 

% Written by: Sebastian Valencia, Universidad de los Andes, 2016 

    n = size(A, 1);         % matrix dimension
    L = zeros(n, n);        % allocating space for the lower triangular matrix
    
    for i=1:n
        % test if the matrix is positive definite
        tmp = A(i, i) - L(1:(i - 1), i)'* L(1:(i - 1), i);
        % if fail the test, report it immediately 
        if(tmp <= 0) 
            error('A should be a positive definite matrix');
        end;        
        L(i, i) = sqrt(tmp); % the diagonal, as computed in the derivation
        % popoulate L(i, j) where i <> j
        for j = (i+1):n
            sum = L(1:(i - 1), i)' * L(1:(i - 1), j);
            L(i, j) = (A(i, j) - sum) / L(i, i);
        end;        
    end;
end    