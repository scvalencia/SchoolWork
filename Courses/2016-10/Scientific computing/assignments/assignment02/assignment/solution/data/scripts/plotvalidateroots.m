% plotting procedure
Y = [matlaberrors; bairstowerrors]';

stem(degrees', Y, 'filled', 'LineStyle','-.')
title('Measure of \epsilon_{abs} computing the roots of a polynomial of random degree')
xlabel('Polynomial degree') % x-axis label
ylabel('Error') % y-axis label
legend('roots() from MATLAB', sprintf('bairstow() \\epsilon = %f', epsilon), 'location','southoutside')
set(gcf, 'Position', [400 400 700 700]);