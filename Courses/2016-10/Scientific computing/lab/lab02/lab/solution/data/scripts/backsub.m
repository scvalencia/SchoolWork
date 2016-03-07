function x=backsub(A,y)
    % backsub: solves upper triangular system A*x = y using backwards substitution
    % usage: x=backsub(A,y);
    %
    % arguments:
    % A (nxn) - upper triangular matrix
    % y (nx1) - vector
    %
    % x (nx1) - solution to A*x = y

    % check to see that A is upper triangular
    if any(any(tril(A,-1)))
       error('A must be upper triangular')
    end

    % check dimensions of A and y
    [n,m]=size(A);
    if n~=m
       error('A must be square');
    end
    if any([n 1]~=size(y))
       error('y must be a vector with the same # of rows as A');
    end

    % perform backwards substitution
    x=zeros(n,1);
    x(n)=y(n)/A(n,n);
    for i=n-1:-1:1
       x(i)=(y(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
    end 
end