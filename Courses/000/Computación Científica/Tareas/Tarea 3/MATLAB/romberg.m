% Algoritmo de Integración de Romberg
% Entradas
    % f - Función explícita de Matlab. e.g., f = @(x) x/(1-x.^2)
    % a,b - límites del intervalo de integración.
    % n - número de aproximaciones a calcular; define la dimensión de la matriz
    % de Romberg -> R \in R^(n*n).
    % tol - error admisible para la aproximación de Romberg.
% Salidas:
    % r - Matriz de Romberg con valores aproximados de la integral

function R = romberg(f, a, b, n, tol)
    
    % Tamaños de intervalo desde aproximación de orden O(h) hasta la
    % aproximación de orden O(h^(2n))
    h = (b - a) ./ (2.^(0:n-1));
    
    % Inicialización del primer elemento de la matriz de Romberg
    R(1,1) = (b - a) * (f(a) + f(b)) / 2;

    % Ciclo principal
    for j=2 : n
        % Cálculo iterativo de área con regla del trapecio
        suma_trapecio = 0;
        for i = 1:2^(j-2)
            suma_trapecio = suma_trapecio + f(a + (2 * i - 1) * h(j));
        end
        % Se guarda el valor de la integral para la aproximación j-ésima de
        % primer orden
        R(j,1) = R(j-1,1) / 2 + h(j) * suma_trapecio;

        % Extrapolación de Richardson
        % Se utiliza la extrapolación de Richardson para determinar con mayor
        % precisión y velocidad computacional el valor exacto de la integral
        for k = 2:j
            R(j,k) = (4^(k-1) * R(j,k-1) - R(j-1,k-1)) / (4^(k-1) - 1);
        end

        % Se verifica como criterio de convergencia la diferencia entre los
        % últimos valores calculados de la matriz de Romberg, como lo indica el
        % libro texto.
        if abs(R(j,j) - R(j-1, j-1)) < tol
            return
        end
    end
end