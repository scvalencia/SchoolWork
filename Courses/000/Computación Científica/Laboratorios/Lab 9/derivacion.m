%clear all; clc;
syms x;

[x1,d1] = derivada(1);
[x2,d2] = derivada(0.1);
[x3,d3] = derivada(0.01);
[x4,d4] = derivada(0.001);

f1 = double(subs(3*x.^2 - 50*sin(10*x) - 4*x - 6, x, x1));
f2 = double(subs(3*x.^2 - 50*sin(10*x) - 4*x - 6, x, x2));
f3 = double(subs(3*x.^2 - 50*sin(10*x) - 4*x - 6, x, x3));
f4 = double(subs(3*x.^2 - 50*sin(10*x) - 4*x - 6, x, x4));

errrel1 = abs(f1-d1)./f1; errrel2 = abs(f2-d2)./f2; 
errrel3 = abs(f3-d3)./f3; errrel4 = abs(f4-d4)./f4; 
errabs1 = f1-d1; errabs2 = f2-d2;
errabs3 = f3-d3; errabs4 = f4-d4;

figure; hold on;
semilogy(x1, log10(abs(errrel1)), 'r'); semilogy(x2, log10(abs(errrel2)), 'g');
semilogy(x3, log10(abs(errrel3)), 'b'); semilogy(x4, log10(abs(errrel4)), 'k'); 
figure; hold on;
plot(x1, errabs1, 'r'); plot(x2, errabs2, 'g');
plot(x3, errabs3, 'b'); plot(x4, errabs4, 'k');