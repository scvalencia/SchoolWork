%% Runge-Kutta RK4

clc; clear all;
h = 0.001;
x = 0:h:1;

f1 = @(x, y1, y2) y2;
f2 = @(x, y1, y2) 4*y2 - 3*y1;

y1 = zeros(length(x), 1);
y2 = zeros(length(x), 1);
y1(1) = 0; y2(1) = -2;

for i=2 : length(x)    
    k1 = h*f1(x(i-1), y1(i-1), y2(i-1));
    l1 = h*f2(x(i-1), y1(i-1), y2(i-1));
    
    k2 = h*f1(x(i-1) + h/2, y1(i-1) + k1/2, y2(i-1) + l1/2);
    l2 = h*f2(x(i-1) + h/2, y1(i-1) + k1/2, y2(i-1) + l1/2);
    
    k3 = h*f1(x(i-1) + h/2, y1(i-1) + k2/2, y2(i-1) + l2/2);
    l3 = h*f2(x(i-1) + h/2, y1(i-1) + k2/2, y2(i-1) + l2/2);
    
    k4 = h*f1(x(i-1) + h, y1(i-1) + k3, y2(i-1) + l3);
    l4 = h*f2(x(i-1) + h, y1(i-1) + k3, y2(i-1) + l3);
       
    y1(i) = y1(i-1) + (k1 + 2*k2 + 2*k3 + k4)/6;
    y2(i) = y2(i-1) + (l1 + 2*l2 + 2*l3 + l4)/6;
end


%% Runge-Kutta RKF 45
clc; clear all;
f = @(x, y) 2 + y.^2/2;
tol = 1e-7;
h = 0.1;
y = []; y(1) = 0; x = []; x(1) = 0;
z = []; z(1) = 0;
error = 1000;
i = 2;

while i < 1000
    k1 = h*f(x(i-1), y(i-1));
    k2 = h*f(x(i-1) + h/4, y(i-1) + k1/4);
    k3 = h*f(x(i-1) + 3*h/8, y(i-1) + 3*k1/32 + 9*k2/32);
    k4 = h*f(x(i-1) + 12*h/13, y(i-1) + 1932*k1/2197 - 7200*k2/2197 + 7296*k3/2197);
    k5 = h*f(x(i-1) + h, y(i-1) + 439*k1/216 - 8*k2 + 3680*k3/513 - 845*k4/4104);
    k6 = h*f(x(i-1) + h/2, y(i-1) - 8*k1/27 + 2*k2 - 3544*k3/2565 - 1859*k4/4104 - 11*k5/40);
    y(i) = y(i-1) + 25*k1/216 + 1408*k3/2565 + 2197*k4/4104 - k5/5;
    z(i) = y(i-1) + 16*k1/135 + 6656*k3/12825 + 28561*k4/56430 - 9*k5/50 + 2*k6/55;
    
    % Cálculo del nuevo tamaño de paso
    s(i) = (tol*h/(2*abs(z(i) - y(i)))).^0.25;
    x(i) = x(i-1) + h;
    h = h*s(i);
    error = abs(z(i) - y(i));
    i = i + 1;
end

%% Método de Hamming

f = @(x,y) x^2 + 2*x - y;
h = 0.01;
x = 0:h:3;
y = ones(length(x), 1);

% Se definen los primeros cuatro valores de la EDO
% con el método de Runge-Kutta de 4 orden (RK4)
for i=2 : length(x)
    k1 = h*f(x(i-1), y(i-1));
    k2 = h*f(x(i-1) + h/2, y(i-1) + k1/2);
    k3 = h*f(x(i-1) + h/2, y(i-1) + k2/2);
    k4 = h*f(x(i-1) + h, y(i-1) + k3);
    y(i) = y(i-1) + (k1 + 2*k2 + 2*k3 + k4)/6;
end

% Se inicializan parámetros para Hamming
f0 = f(x(1),y(1)); f1 = f(x(2),y(2));
f2 = f(x(3),y(3)); f3 = f(x(4),y(4));

p_old = 0; c_old = 0;

for i=4 : length(x)-1
    % Cálculo de predicción
    p(i+1) = y(i-3) + 4*h*(2*f1 - f2 + 2*f3)/3;
    % Corrección
    p_mod = p(i+1) + 112*(c_old-p_old)/121;
    f4 = f(x(i+1),p_mod);
    c_new = (9*y(i) - y(i-2) + 3*h*(-f2+2*f3+f4))/8;
    % Valor corregido
    y(i+1) = c_new + 9*(p(i+1)-c_new)/121;
    % Actualización de variables
    p_old = p(i+1); c_old = c_new;
    f1 = f2; f2 = f3;
    f3 = f(x(i+1),y(i+1));
end