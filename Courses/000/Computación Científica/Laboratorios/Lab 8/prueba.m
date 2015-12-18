clear all; close all; clc;
 
x = [0 0.9 2.92 4.16 4.76 9.34];
y = [1 7.19 9.18 10.14 10.8 12.1];
n = length(x);
dx = zeros(n-1,1);
dy = zeros(n-1,1);
d = zeros(n-1,1);

% Gráfica puntos interpolantes
plot(x,y,'rx','linewidth',2);
xlabel('x');
ylabel('y');
title('Splines Cúbicos Naturales')
hold on;

% dx, dy, d
 for i=2:n
     dx(i-1) = x(i) - x(i-1);
     dy(i-1) = y(i) - y(i-1);
     d(i-1) = dy(i-1)/dx(i-1);
 end 

diagonal_superior = zeros(n-1,1);
diagonal_centro = zeros(n,1);
diagonal_inferior = zeros(n-1,1);
dr = zeros(n,1);

% Inicialización valores de matriz A
% La matriz A es tridiagonal
dr(1) = d(1);
diagonal_centro(1) = 2;
diagonal_centro(n) = 2;
diagonal_superior(1) = 1;
diagonal_inferior(n-1) = 1;

syms v
for i=2 : n-1
    diagonal_centro(i) = 2*(dx(i-1) + dx(i));
    diagonal_superior(i) = dx(i-1);
    diagonal_inferior(i-1) = dx(i);
    dr(i) = 3*(d(i-1)*dx(i) + d(i)*dx(i-1));
end 

% Matriz A con las diagonales
A = diag(diagonal_centro) + diag(diagonal_superior, 1) + diag(diagonal_inferior, -1);
k = linsolve(A,dr);

for i=1 : n-1
 t(i)=(v-x(i))/dx(i);
 tb(i) = 1-t(i);
 q(i) = t(i)*y(i+1)+tb(i)*y(i)+dx(i)*((k(i)-d(i))*t(i)*(tb(i))^2-(k(i+1)-d(i))*(t(i)^2)*tb(i));
end

for i=1 : n-1
    xx = linspace(x(i),x(i+1));
    plot(xx, subs(q(i), v, xx));
end