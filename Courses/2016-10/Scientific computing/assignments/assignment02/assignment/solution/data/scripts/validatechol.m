% Compare cholesky() vs chol() on matrices of dimension 10, 20, 30

ns = [10 20 30]; iter = size(ns, 2);
merrors = zeros(1, iter); oerrors = zeros(1, iter);

i = 1;
while i <= iter    
    A = genmatrix(ns(i)); LM = chol(A); LO = cholesky(A);    
    em = norm(LM' * LM - A); om = norm(LO' * LO - A);    
    merrors(i) = em; oerrors(i) = om;
    i = i + 1;
end;