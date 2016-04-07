function x = basecase(polynomial)
% fetch the roots of a polynomial of degree <= 3, by using auxiliary
% methods (quadratic equation formula, Cardano fomulae)
% size(polynomial) <= 3
% let pol be polynomial in
% pol(1) != 0 /\ polyval(polynomial, x) = 0

%   Arguments:
%       polynomial: A real valued quadratic polynomial [a b c d?]
%       if d is give, it solves a cubic equation, otherwise, it solves a
%       quadratic equation.

%   USAGE:
%   x = basecase(polynomial)
%   polyval(polynomial, x) = 0

% Written by: Sebastian Valencia, Universidad de los Andes, 2016 
    n = size(polynomial, 2) - 1; % The degree
    x = zeros(1, n); % The desired roots
    if(n == 2)
        x = quadratic(polynomial); % Solve it by quadratic if n = 2
    elseif(n == 3)
        x = cardano(polynomial); % Solve it using Cardano method, if n = 3
    end;    
end