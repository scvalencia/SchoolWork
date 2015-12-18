% Definici�n de variables
x = 0:0.1:10; % Vector x con dx = 0.1
n = [0 1]; % �rdenes de la funci�n de Bessel J_n(x) 

for j=1 : length(n)
    for i=1 : length(x)
       % Definci�n de la funci�n expl�cita de Matlab f(x)
       f = inline(sprintf('cos(%.1f*sin(x)-%d*x)/pi', i, j));
       % C�lculo de la matriz de Romberg con resultado de precisi�n 1e-6.
       R = romberg(f, 0, pi, 15, 1e-6)';
       % Se almacena el valor de la integral para la funci�n de Bessel de
       % orden j, en x = x(i).
       % Se toma el �ltimo valor de la Matriz de Romberg, i.e., al que
       % converge el algoritmo.
       int_val(j,i) = R(size(R,1), size(R,2)); 
    end
end

% Se grafican los resultados de las integrales para cada funci�n.
plot(x, int_val(1,:))
plot(x, int_val(2,:),'r')