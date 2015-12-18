function [ x ] = gauss_seidel( A, b, x0, c, tol )

    if det(A) == 0
        disp('El determinante es cero, el sistema no tiene �nica soluci�n');
        return;
    end
    
    n = length(b);
    x_old = x0;
    D = diag(diag(A));
    L = tril(A);
    U = triu(A) - D;
    M = linsolve(L,U);
    
    Re = max(eig(M)); % Radio espectral
    if Re > 1
        disp('Radio espectral mayor a 1 m�todo no converge');
        return;
    end
    
    error = tol + 1;
    k = 1;
    
    while (error > tol) & (k < c)
       x_new = x_old;
       for i=1 : n
           alpha = 0;
           for j=1 : i-1
               alpha = alpha + A(i,j)*x_new(j);
           end
           for j=i+1 : n
               alpha = alpha + A(i,j)*x_old(j);
           end
           x_new(i) = (b(i) - alpha)/A(i,i);
           error = abs(x_new - x_old);
           k = k + 1;
       end
    end
    x = x_new;
end

