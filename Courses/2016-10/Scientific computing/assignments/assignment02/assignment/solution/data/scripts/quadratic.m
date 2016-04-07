function x = quadratic(polynomial)
% fetch the roots of a second degree polynomial over the complex field:
% size(polynomial) = 3
% let pol be polynomial in
% pol(1) != 0 /\ pol(1)x^2 + pol(2)x + pol(3) = 0

%   Arguments:
%       polynomial: A complex valued quadratic polynomial [a b c]

%   USAGE:
%   x = quadratic(polynomial)
%   x(1) /\ x(2) are the unique values that satisfies:
%   forall x in [x(1), x(2)] polyval(polynomial, x) = 0

% Written by: Sebastian Valencia, Universidad de los Andes, 2016 

    % Coefficients
    a = polynomial(1); b = polynomial(2); c = polynomial(3);
    
    % Roots given by the quadratic formula
    x(1) = (-b + sqrt(b^2 - 4 * a * c)) / (2 * a);
    x(2) = (-b - sqrt(b^2 - 4 * a * c)) / (2 * a);
    
end