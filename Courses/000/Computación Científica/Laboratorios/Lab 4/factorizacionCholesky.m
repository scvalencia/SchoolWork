function [ G ] = factorizacionCholesky( A )

    n = length(A);
    for j=1 : n
        if j>1
            A(j:n, j) = A(j:n,j) - A(j:n, 1:j-1)*A(j,1:j-1)';
        end
        A(j:n,j) = A(j:n,j)/sqrt(A(j,j));
    end
    
    G = tril(A);

end