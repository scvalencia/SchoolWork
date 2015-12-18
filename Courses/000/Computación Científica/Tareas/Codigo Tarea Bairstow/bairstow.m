function r = bairstow(polinomio,error,N)
% polinomio es un vector con los coeficientes b_i del polinomio en orden
% descendente, e.g., x^2 + 3x^3 -> [3 1 0]
% error - error admisible para el cálculo de p y q para el calculo de cada
% raiz
% N - número de iteraciones máximo en caso de no alcanzar la convergencia
% por error.

n = size(polinomio,2);
q = polinomio;
r = zeros(1,n-1);

for i = 1:floor(n/2)
   % Se revisa si el orden del polinomio es par o impar
   % de esta manera se determina cómo calcular las raices
   % en el úlimo caso, es decir, cuando el cociente, producto 
   % de la descompocisión es de orden 2 o 3.
   if (size(q,2) <= 3)
      f = q;
      q = 0;
   else
      % Si el cociente es de orden par se calcula el nuevo cociente
      % y los factores p y q de la expresión de segundo orden, que
      % para efectos de código se almacenan en un vector f, donde,
      % f(1) = 1, f(2) = p, f(3) = q
      [q,f] = bairstow_aux(q,error,N);
   end
   % Se calculan las raices de forma analítica para el caso de una raiz
   % i.e., el caso de cociente de primer orden.
   if size(f,2) == 2
      r(2*i-1) = -f(2)/f(1);
   % Se calculan las raices de forma analítica para el caso de dos raices
   % i.e., el caso de cociente de orden par.
   else
      disc = f(2)^2 - 4*f(1)*f(3);
      r(2*i-1) = (-f(2) - sqrt(disc))/(2*f(1));
      r(2*i)   = (-f(2) + sqrt(disc))/(2*f(1));
   end;
end;
r = r'; % Se retorna un vector con las n raices del polinomio del orden n