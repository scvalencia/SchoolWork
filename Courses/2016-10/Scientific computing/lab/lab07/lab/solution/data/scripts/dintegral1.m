f1 = @(x,y) 1 ./ (1 - x.*y);    % Function to handle
i1 = quad2d(f1, 0, 1, 0, 1);    % Double integral betweene the given plane