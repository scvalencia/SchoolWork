% Plots the value of the machine epsilon around a number

x = 0:100000;
x = x.^100;

y = MaqEps(x);

plot(x, y);
set(gcf, 'Position', [400 400 700 700]);
saveas(gcf, '../img/plot_epsilon.png');

eps_max = max(y);
eps_min = min(y);

range = eps_max - eps_min;

