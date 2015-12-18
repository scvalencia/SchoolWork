x1 = -10:0.5:10;
x2 = -10:0.5:10;
r1 = 1 + 2*x2;
r2 = zeros(length(x1));
r3 = ones(length(x1))*3/2;

figure; hold on;
plot(x1, r1);
plot(x1, r2);
plot(r3, x1);