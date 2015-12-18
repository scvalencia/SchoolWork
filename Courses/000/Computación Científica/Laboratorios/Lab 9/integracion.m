function [r1, r21, r22, r3] = integracion(RelTol, AbsTol)

    f1 = @(x,y) 1 ./ (1 - x.*y); % Función 1
    f2 = @(x,y,z) 64.*x.*y.*z.*(1 - x).^2; % Función 2
    f3 = @(x,y) x.^2.*y; % Función 3
    
    % Integral de función 1
    r1 = integral2(f1, 0,1,0,1, 'RelTol', RelTol, 'AbsTol', AbsTol);
    % Integral de función 2
    r21 = integral3(f2, 0,1,0,1,0,1, 'RelTol', RelTol, 'AbsTol', AbsTol);
    r22 = triplequad(f2, 0,1,0,1,0,1,RelTol);
    % Integral de función 3
    r3 = integral2(f3, 1,2, @(x) x.^2, @(x) x.^4, 'RelTol', RelTol, 'AbsTol', AbsTol);
    
end