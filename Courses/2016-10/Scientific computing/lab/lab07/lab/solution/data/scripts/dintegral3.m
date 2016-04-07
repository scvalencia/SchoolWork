f3 = @(x,y) x.^2.*y;            % Function for the integral
c = @(x) x.^2;                  % Lower limit of integration
d = @(x) x.^4;                  % Upper limit of integration
i3 = quad2d(f3, 1, 2, c, d);    % Double integral over the specified plane