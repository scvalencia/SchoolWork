year = [1900 1920 1940 1960 1980 2000];
pop = [76.0 105.7 131.7 179.3 226.5 281.4];

plot(year, pop,'bo');
title('Poblaci\''on de Estados Unidos. 1900-2000','interpreter','latex')
ylabel('Millones','interpreter','latex');

set(gcf, 'Position', [400 400 1000 400]);
saveas(gcf, '../img/populationplot.png');