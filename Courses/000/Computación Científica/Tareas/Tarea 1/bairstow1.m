function [q,f] = bairstow_aux(p,error,N) % error -> error admisible
% Se calcula de forma iterativa los valores de p y q hasta conseguir error
% admisible, de modo que (Rx + S) tienda a cero.
n = size(p,2); % orden del polinomio
r = rand; % aproximación inicial al valor de r
s = rand; % aproximación inicial al valor de s
for i = 1:N
   d = [1 -r -s];                % divisor
   % deconv resuelve el proceso de división sintética
   [q1,r1] = deconv(p,d); % q1: cociente, r1: residuo
   % calculo los coeficientes b_i para el sistema de dos ecuaciones
   b0 = r1(n) + r*r1(n-1);
   b1 = r1(n-1);
   p2 = [q1 b1 b0];
   % se cálcula de nuevo el cociente con división sintética a partir de la
   % nueva solución de p.
   [q2,r2] = deconv(p2,d); 
   % cálculo de expresiones con derivadas parciales
   c1 = r2(n-1);                 
   c2 = q2(n-2);
   c3 = q2(n-3);
   % Definición del sistema de ecuaciones 2x2, para hallar R y S
   % (Rx + S)
   a = [c2 c3; c1 c2];
   b = [-b1; -b0];
   sol = a\b; % solución del sistema
   % Método de Newton-Rhapson
   % Se calculan nuevos valores, sumo valor missmatch
   r = r + sol(1);
   s = s + sol(2);
   if (norm(sol) < error)
      break;
   end;
end;
% A partir de la última solución de residuo (Rx + S)
q = q1; % se retorna el último cociente
f = d; % se retorna el último divisor