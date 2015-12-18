function [ x ] = jacobi( A, b, x0, c, tol )

    if det(A) == 0
        disp('El determinante es cero, el sistema no tiene única solución');
        return;
    end
    
    n = length(b);
    x_old = x0;
    D = diag(diag(A));
    L = tril(A) - D;
    U = triu(A) - D;
    M = D \ (L+U);
    
    Re = max(eig(abs(M))); % Radio espectral
    if Re > 1
        disp('Radio espectral mayor a 1, método no converge');
        return;
    end
    
    error = tol + 1;
    k = 1;
    while (error > tol) & (k < c)
        for i=1 : n
            alpha = 0;
            for j=1 : n
                if j ~= i
                    alpha = alpha + A(i,j)*x_old(j);
                end
            end
            x_new(i) = (b(i) - alpha)/A(i,i);
        end
        error = abs(x_old(:) - x_new(:));
        x_old = x_new;
        k = k + 1;
    end

    x = x_new';

end