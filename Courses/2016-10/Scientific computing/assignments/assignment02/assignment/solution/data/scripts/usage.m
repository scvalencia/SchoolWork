A = [ 2 -1 0 ; -1 3 -1 ; 0 -1 2];
b = [1 8 -5];

[kjac, xjac] = jacobi(A, b, zeros(3, 1));
[kgas, xgas] = gaussseidel(A, b, zeros(3, 1));