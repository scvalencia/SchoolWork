function [t,d] = derivada(h)

    x = 0:h:10;
    y = 5*cos(10*x) + x.^3 - 2*x.^2 - 6*x + 10;
    d = diff(y)./diff(x);
    t = (x + h/2); t(length(t)) = [];

end