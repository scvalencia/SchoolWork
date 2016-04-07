function [A, b] = gensystem(n)
    A = diag(4*ones(1,n),0)+diag(- 1*ones(1,n-1),1)+diag(-1*ones(1,n-1),-1);
    b = randi(100, n, 1);
end