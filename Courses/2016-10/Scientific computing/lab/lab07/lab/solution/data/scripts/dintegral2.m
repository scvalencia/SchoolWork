f2 = @(x,y) 64.*x.*y.*(1 - x).^2;   % Function to handle
i2 = triplequad(f2, 0, 1, 0, 1);    % Triple integral betweene the given surfave