function [epsilon] = KahanEpsilon(x)
    a = 4.0/3.0;
    eps = 0.0;
    while(true)
        b = a - 1.0;
        c = b + b + b;
        eps = abs(c - 1.0);
        if(eps ~= 0.0)
            break;
        end;
    end;

    epsilon = eps * abs(x);
end