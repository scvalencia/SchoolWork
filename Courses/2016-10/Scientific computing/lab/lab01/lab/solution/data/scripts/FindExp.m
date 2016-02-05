%------------------------------------------- 
function [estimate, k] = FindExp(tolerance)
    k = 10;
    real = exp(1);
    estimate = (1 + (1 / k)) ^ k;
    
    while(abs(estimate - real) > tolerance)
        k = k * 100;
        estimate = (1 + (1 / k)) ^ k;
    end

end