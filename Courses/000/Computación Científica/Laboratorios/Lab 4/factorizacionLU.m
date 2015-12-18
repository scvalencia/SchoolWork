function [ L, U ] = factorizacionLU( A )
    
    n = size(A,1);
    L = tril(ones(n,n));
    U = zeros(n,n);
    for j=1 : n
        if j == 1
            v = A(:,1);
        else
            a = A(:,j);
            
            % Resolver el sistema lineal con la matriz triangular inferior
            z = L( 1:j-1 , 1:j-1) \ a(1:j-1);
            U(1:j-1,j) = z;
            v(j:n) = a(j:n) - L(j:n , 1:j-1)*z;
        end
        U(j,j) = v(j);
        L(j+1:n , j) = v(j+1:n)/v(j);
    end
end