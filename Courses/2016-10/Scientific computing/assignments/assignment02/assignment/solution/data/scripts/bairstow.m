function [p, q, b] = bairstow(polynomial, error)
% find the roots of arbitrary degree polynomials using the Bairstow method,
% the desired polynomial to solve, it's related to polynomial, while the 
% tolerance, is attached to the error parameter. Given a polynomial, this 
% function finds a factorization determined by p, q and a normialized 
% polynomial of degree (n - 2), whose coefficients are in b.
% polynomial = (x^2 + px + q)(x^(n-2) + b(1)x^(n - 2 - 1) + ... + b(n - 2))
% So the roots of (x^2 + px + q), are roots of polynomial

%   Arguments:
%       polynomial: A real valued polynomial, whose degree is determined by
%       the size of this matrix.
%       error: The tolerance required for iterating changing the paramters
%       p, q, and b

%   USAGE:
%   [p, q, b] = bairstow(polynomial, error)
%   (x^2 + px + q)(b(x)) = polyomial + (Rx + S + error) = 0

% Written by: Sebastian Valencia, Universidad de los Andes, 2016 
    p = 0; q = 0;  % Initial values for quadratic term coefficients 
    n = size(polynomial, 2); % Polynomial's degree
    R = Inf; S = Inf; % Terms to reduce, suitable value for each is 0 
    
    % b for remainder polynomial term, c, d required for computation
    b = zeros(1, n - 2); c = zeros(1, n - 2); d = zeros(1, n - 2);
    
    while(error < abs(R + S))
        
        % Initial values for each matrix (polynomial)
        b(1) = polynomial(1) - p; b(2) = polynomial(2) - p * b(1) - q;
        c(1) = -1; c(2) = -b(1) + p;
        d(1) = 0; d(2) = -1;
        
        % Recurrence relation
        for i = 3:(n - 2)
            b(i) = polynomial(i) - p * b(i - 1) - q * b(i - 2);
            c(i) = -b(i - 1) - p * c(i - 1) - q * c(i - 2);
            d(i) = -b(i - 2) - p * d(i - 1) - q * d(i - 2);
        end;
        
        % New values for both R and S
        R = polynomial(n - 1) - p * b(n - 2) - q * b(n - 3);
        S = polynomial(n) - q * b(n - 2);
        
        % Gradient for R and S
        drdp = -b(n - 2) - p * c(n - 2) - q * c(n - 3);
        dsdp = -q * c(n - 2);        
        drdq = -b(n - 3) - p*d(n - 2) - q * d(n - 3);
        dsdq = -b(n - 2) - q * d(n - 2);
        
        % New values for p and q
        J = drdp * dsdq - dsdp * drdq;
        p = p - (1 / J) * (R * dsdq - S * drdq);
        q = q + (1 / J) * (R * dsdp - S * drdp);
        
    end;    
end