function [S] = clamped(x, f, fpo, fpn)

    n = size(x, 2);
    h = zeros(n - 1, 1);
    
    % Companion tems of each polynomial temrm
    a = f'; b = zeros(n - 1, 1); c = zeros(n, 1); d = zeros(n - 1, 1);
    
    % Resulting polynomials
    S = zeros(n - 1, 4);
    
    % h's for natural spline
    for i=1:n-1
        h(i) = x(i + 1) - x(i);
    end;
        
    % alphas for coefficient population
    alpha = zeros(n, 1);
    alpha(1) = 3 * (f(2) - f(1)) / h(1) - 3*fpo;
    alpha(n) = 3 * fpn - 3 * (f(n) - f(n - 1)) / h(n - 1);
    
    for i=2:n-1
        ls = 3 / h(i) * (f(i + 1) - f(i));
        rs = 3 / h(i - 1) * (f(i) - f(i-1));
        alpha(i) = ls - rs;
    end;
    
    l = zeros(n, 1);
    mu = zeros(n, 1);
    z = zeros(n, 1);
    
    l(1) = 2 * h(1);
    mu(1) = 0.5;
    z(1) = alpha(1) / l(1);
    
    for i=2:n-1
        l(i) = 2*(x(i+1) - x(i-1)) - h(i-1)*mu(i-1);
        mu(i) = h(i) / l(i);
        z(i) = (alpha(i) - h(i-1)*z(i-1)) / l(i);
    end;
    
    l(n) = h(n-1)*(2 - mu(n-1));
    z(n) = (alpha(n) - h(n-1)*z(n-1)) / l(n);
    c(n) = z(n);
    
    for j=n-1:-1:1
        c(j) = z(j) - mu(j) * c(j+1);
        b(j) = (f(j+1) - f(j))/h(j) - h(j)*(c(j+1) + 2*c(j)) / 3;
        d(j) = (c(j+1) - c(j)) / (3*h(j));
    end; 
    
    for j=1:n-1    
        syms y;
        pol = a(j) + b(j) * (y - x(j)) + c(j) * (y - x(j))^2 + d(j) * (y - x(j))^3;
        S(j,:) = sym2poly(pol);
    end;
    
end