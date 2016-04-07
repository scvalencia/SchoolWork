figure
subplot(2,1,1)       % add first plot in 2 x 1 grid
stem(ns', merrors, 'filled', 'LineStyle','-.')
title('Measure of \epsilon computing the Cholesky factorization with chol()')
xlabel('Matrix size') % x-axis label
ylabel('\epsilon') % y-axis label
legend('\epsilon using chol()')
set(gcf, 'Position', [400 400 700 700]);

subplot(2,1,2)       % add second plot in 2 x 1 grid
h = stem(ns', oerrors, 'filled', 'LineStyle','-.')
h.Color = 'red';
title('Measure of \epsilon computing the Cholesky factorization with cholesky()')
xlabel('Matrix size') % x-axis label
ylabel('\epsilon') % y-axis label
legend('\epsilon using cholesky()')
set(gcf, 'Position', [400 400 700 700]);

saveas(gcf, '../img/cholcomparisson.png');