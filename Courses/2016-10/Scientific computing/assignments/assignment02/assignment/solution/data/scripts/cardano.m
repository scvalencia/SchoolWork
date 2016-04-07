function x = cardano(polynomial)
% fetch the roots of a cubic polynomial over the real field.
% size(polynomial) = 4
% let pol be polynomial in
% pol(1) != 0 /\ pol(1)x^3 + pol(2)x^2 + pol(3)x + pol(4) = 0

%   Arguments:
%       polynomial: A complex valued quadratic polynomial [a b c]

%   USAGE:
%   x = cardano(polynomial)
%   x(1) /\ x(2) /\ x(3) are the unique values that satisfies:
%   forall x in [x(1), x(2), x(3)] polyval(polynomial, x) = 0

% Written by: Nam Sun Wang, University or?f Maryland, College Park, 2006c
% Taken from: https://raw.githubusercontent.com/LCAV/edmbox/master/cubicfcnroots.m
% Formula used are given in Tuma, "Engineering Mathematics Handbook"

    % Coefficients
    a = polynomial(1); b = polynomial(2);
    c = polynomial(3); d = polynomial(4);

    p  = c/a - b*b/a/a/3. ;
    q  = (2.*b*b*b/a/a/a - 9.*b*c/a/a + 27.*d/a) / 27. ;
    
    DD = p*p*p/27. + q*q/4. ;
    
    if (DD < 0.)
        phi = acos(-q/2./sqrt(abs(p*p*p)/27.));
        temp1=2.*sqrt(abs(p)/3.);
        y1 =  temp1*cos(phi/3.); y2 = -temp1*cos((phi+pi)/3.); 
        y3 = -temp1*cos((phi-pi)/3.);
    else
        temp1 = -q/2. + sqrt(DD);
        temp2 = -q/2. - sqrt(DD);
        u = abs(temp1)^(1./3.); v = abs(temp2)^(1./3.);
        if (temp1 < 0.) u = -u; end
        if (temp2 < 0.) v=-v; end
        y1  = u + v; y2r = -(u+v)/2.; y2i =  (u-v)*sqrt(3.)/2.;
    end
    
    temp1 = b/a/3.;
    y1 = y1-temp1;
    if (DD < 0.) y2 = y2-temp1; y3 = y3-temp1; else y2r=y2r-temp1; end
    
    if (DD < 0.)
        x(1) = y1; x(2) = y2; x(3) = y3;
    elseif (DD == 0.)
        x(1) =  y1; x(2) = y2r; x(3) = y2r;
    else
        x(1) = y1; x(2) = y2r + y2i*i; x(3) = y2r - y2i*i;
    end;
end