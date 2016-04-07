function lag = lagrange(x,y)
% Find the coefficients of the interpolant polynomial by Lagrange's method
    
    N = length(x);      % Data dimension
    lag = 0;            % Result polynomial
    
    for m = 1:N
      P = 1;            % Interpolant fraction
      for k = 1:N
        if k ~= m
            % The shape of the fraction
            P = conv(P, [1 - x(k)]);
            P = P / (x(m) - x(k));
        end
      end
      % Polynomial update by current term
      lag = lag + y(m)*P;
    end;
end