function [eps] = MaqEps(x)

    eps = x;
    fl = x + eps;
    
    while fl > x        
        eps = eps / 2.0;
        fl = x + eps;
    end;
    
    eps = abs(2.0 * eps);
end