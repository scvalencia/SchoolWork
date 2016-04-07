function [A, sol] = validation(x, y)

    n = size(x, 2);     % Cardinality of data set degree
    A = zeros(n, n);    % The dependent-data matrix
    sol = y;            % We're supossed to solve A * a' = sol
    
    % Matrix population A(i, j) = x(i)^(j - 1)
    for i =1:n
        for j=1:n, A(i, j) = x(i)^(j - 1); end
    end;    
end