function [k, guess] = jacobi(A, B, guess)
    kmax = 100; tol = 10e-10; epsilon = 0.5e-4;
    
    n = size(A, 1);
    y = zeros(n, 1);
    exit = 0;
    
    for k = 1:kmax
        y = guess;
        for i = 1: n
            sum = B(i);
            diag = A(i, i);
            
            if(abs(diag) < tol)
                error('Diagonal element too small');
            end;
            
            sum = sum - A(i, 1:(i - 1)) * y(1:(i - 1)) - A(i, (i + 1):n) * y((i + 1):n);            
            guess(i) = sum / diag;
            
        end;
        
        if norm(guess - y) < epsilon
            exit = 1;
            break;
        end
    end;
    
    if(~exit)
        error('Diagonal element too small');   
    end;
end