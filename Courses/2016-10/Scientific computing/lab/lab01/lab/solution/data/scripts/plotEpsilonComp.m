% Plots the value of the machine epsilon around a number

x = 0:100000;
x = x.^100;

y = MaqEps(x);
z = KahanEpsilon(x);

plot(x, y, x, z);
set(gcf, 'Position', [400 400 700 700]);
saveas(gcf, '../img/plot_epsiloncomp.png');

