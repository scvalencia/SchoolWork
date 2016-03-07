function [matrix, b] = sparserandmatrix(size, kind)

    MIN = 1;
    MAX = 10;
    
    b = randi([MIN MAX], size, 1);
    
    matrix = sparse(randmatrix(size, kind)); 
end