function [Ar, br] = gaussian_elimination(A, b)
    n = size(A,2);
    for j=1 : n-1
        [pivot, k] = max(abs(A(j:n,j)));
        
        if (pivot <= eps)
            disp('Matrix is Singular');
            break;
        end
        
        temp = A(j,:);
        A(j,:) = A(k+j-1,:);
        A(k+j-1,:) = temp;
        
        tempb = b(j);
        b(j) = b(k+j-1);
        b(k+j-1) = tempb;
        
        for i=j+1 : n
            mult = A(i,j)/A(j,j);
            
            A(i,j:n) = A(i,j:n) - mult*A(j,j:n);
            b(i) = b(i) - mult*b(j);
        end
    end
    
    Ar = A;
    br = b;
end