clear all; clc; close all;

%% Forward Euler

h = 0.03;
x = (0:h:1)';
y1 = zeros(length(x), 1);

f = @(x,y) 3 + x - y;

for i=2 : length(x)
    y1(i) = y1(i-1) + h*f(x(i-1),y1(i-1));
end

%% Euler modificado

y2 = zeros(length(x), 1);

for i=2 : length(x)
    k1 = h*f(x(i-1), y2(i-1));
    k2 = h*f(x(i-1) + h, y2(i-1) + k1);
    y2(i) = y2(i-1) + (k1 + k2)/2;
end


%% Backwards Euler

y3 = zeros(length(x), 1);

for i=2 : length(x)
    k1 = h*f(x(i-1), y3(i-1));
    y3(i) = y3(i-1) + h*f(x(i), y3(i-1) + k1);
end


%% Runge-Kutta RK4

y4 = zeros(length(x), 1);
for i=2 : length(x)
    k1 = h*f(x(i-1), y4(i-1));
    k2 = h*f(x(i-1) + h/2, y4(i-1) + k1/2);
    k3 = h*f(x(i-1) + h/2, y4(i-1) + k2/2);
    k4 = h*f(x(i-1) + h, y4(i-1) + k3);
    y4(i) = y4(i-1) + (k1 + 2*k2 + 2*k3 + k4)/6;
end

%% Comparación con función real

yreal = 2 + x - 2*exp(-x);
plot(x,yreal,'r', 'DisplayName', 'f(x) real');
hold on;
plot(x,y1,'g', 'DisplayName', 'Fordward Euler');
plot(x,y2,'b', 'DisplayName', 'Euler Modificado');
plot(x,y3,'k', 'DisplayName', 'Backwards Euler');
plot(x,y4,'c', 'DisplayName', 'Runge-Kutta RK4');
legend('show');
xlabel('x');
ylabel('y');
title('Solución Numérica y Real EDO');

%% Error relativo

figure;
semilogy(x, abs(yreal-y1)./yreal,'r', 'DisplayName', 'Fordward Euler');
hold on;
semilogy(x, abs(yreal-y2)./yreal,'g', 'DisplayName', 'Euler Modificado');
semilogy(x, abs(yreal-y3)./yreal,'b', 'DisplayName', 'Backwards Euler');
semilogy(x, abs(yreal-y4)./yreal,'k', 'DisplayName', 'Runge-Kutta RK4');
legend('show');
xlabel('x');
ylabel('error_{realtivo}');
title('Error relativo - métodos numéricos');

%% Error absoluto

figure;
semilogy(x, log(abs(yreal-y1)),'r', 'DisplayName', 'Fordward Euler');
hold on;
semilogy(x, log(abs(yreal-y2)),'g', 'DisplayName', 'Euler Modificado');
semilogy(x, log(abs(yreal-y3)),'b', 'DisplayName', 'Backwards Euler');
semilogy(x, log(abs(yreal-y4)),'k', 'DisplayName', 'Runge-Kutta RK4');
legend('show');
xlabel('x');
ylabel('log(error_{absoluto})');
title('Log(Error absoluto) - métodos numéricos');
