function polynomial = normalized(pol)
% returns a normalized version of the polynoial, that is, an equivalent
% polynomial with same roots, same degree, such that pol(1) = 1

%   Arguments:
%       pol: A real valued polynomial of any degree

%   USAGE:
%   polynomial2 = normalized(polynomial1)
%   polynomial2(1) = 1 /\ roots(polynomial1) = roots(polynomial2)
%   forall x in R, then polynomial1(x) = polynomial2(x)

% Written by: Sebastian Valencia, Universidad de los Andes, 2016 
    
    n = size(pol, 2);           % The degree
    polynomial = zeros(1, n);   % Allocating space for the new version of 
                                % the polynomil
    coef = pol(1);              % The coefficient to perform division with
    
    for i=1:n polynomial(i) = pol(i) / coef; end;    
end