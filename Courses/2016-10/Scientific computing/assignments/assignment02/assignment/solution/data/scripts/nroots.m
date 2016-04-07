function x = nroots(polynomial, error)
% find numerical approximations for the roots of the given polynomial, with
% certain tolerance defined by the argument error. The degree of the polynomial 
% has not restictions at all. It makes uses of quadratic formula and
% Cradano's method for polynomial degrees < 4. Otherwise, it makes use of the Bairstow method as defined in bairstow.m

%   Arguments:
%       polynomial: A real valued polynomial, whose degree is determined by
%       the size of this matrix.
%       error: The tolerance required for iterating changing the paramters
%       p, q, and b

%   USAGE:
%   roots = nroots(polynomial, error)
%   forall r in roots => polyval(polynomial, r) = 0

% Written by: Sebastian Valencia, Universidad de los Andes, 2016
    sz = size(polynomial, 2);       % degree of polynomial
    x = zeros(1, sz - 1);           % allocating memory for the roots
    
    % Is the solution trivial?
    % If so, use alegbraic manipulation
    if((sz - 1) == 1)
        x(1) = -polynomial(2)  / polynomial(1);
    elseif((sz - 1) == 2)
        x = quadratic(polynomial);
    elseif((sz - 1) == 3)
        x = cardano(polynomial);
    % Otherwise, use numerical methods (Bairstow's)
    else
        % Setting up the conditions for proper execution of bairstow's
        % method as define here
        polynomial = normalized(polynomial);
        polynomial = polynomial(1, 2:sz);   % The first coefficient is not important
        n = size(polynomial, 2); % The size of the new polynomial
        
        % While the solution is not trivial
        i = 1;
        while(n > 3)
            % Call Bairstow's method
            [p, q, polynomial] = bairstow(polynomial, error);
            % Get the roots of the quadratic term, then, two new roots for
            % the original polynomial
            quad = quadratic([1 p q]);
            x(i) = quad(1); x(i + 1) = quad(2);
            % Now b is the new polynomial, get the new size
            n = size(polynomial, 2);
            i = i + 2; % 2 more roots found
        end;
           
        % When the solution is trivial, get it by algebraic manipulation,
        % and add it to the roots of the gicen polynomial.
        naive = basecase([1 polynomial]);
        c = 1;
        for j=i:(sz - 1)            
            x(j) = naive(c); c = c + 1;
        end        
    end;    
end