yy = polyval(lag,xx);
nn = polyval(new, xx);

plot(xx,yy,'b', year,pop,'or', xx, nn, '--g')
title('Poblaci\''on de Estados Unidos. 1900-2000','interpreter','latex')
ylabel('Millones','interpreter','latex');

set(gcf, 'Position', [400 400 1000 400]);
saveas(gcf, '../img/populationinterplot.png');