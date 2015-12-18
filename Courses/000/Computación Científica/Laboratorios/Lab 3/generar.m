function [ A, b ] = generar( n )
% Genera un sistema de n ecuaciones lineales Ax = b,
% Donde A es una matriz de n filas y n columnas con:
%   a_{ij} = 1/(i+j-1) para i,j = 1,2,3,...,n
% y b un vector columna de dimension n tal que:
%   b_{i} = sum(j/(i+j-1)) para i=1,2,3,...,n
% Observaciones: La precisión de los números es double
    A = zeros(n,n);
    b = zeros(n,1);
    
    for i=1 : n
        for j=1 : n
            A(i,j) = 1/(i+j-1);
            b(i) = b(i) + j/(i+j-1);
        end
    end
    
end

