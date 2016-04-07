function [] = plotpolroots(pol, name, color, max, min)
% pol is a polynomial represented as in Matlab, name is the name of the
% polynomial to be displayed. color is the color desired for the plot of
% the same polynomial. [min, max], defines the range of evaluation

    % Plotting the polynomial
    x = linspace(max, min);         % x-axis values
    vval = polyval(pol, x);         % y-axis values
    subplot(2, 1, 1);
    plot(x, vval, sprintf('%s', color), 'LineWidth',2);
    title('Graph')
    xlabel('x')
    ylabel('Evaluation of polynomial')
    legend(sprintf('y = %s(x)', name))
    grid on

    % Plotting the roots
    subplot(2, 1, 2);
    ff = plot(roots(pol), 'k*');
    set(ff, 'Markersize',10);
    title('Roots')
    xlabel('Complex component')
    ylabel('Real component')
    grid on 
    
    % General title, and saving procedures
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
    text(0.5, 1,sprintf('Graph and roots of polynomial %s(x) = %s',name, char(poly2sym(pol))),'HorizontalAlignment','center','VerticalAlignment', 'top');
    set(gcf, 'Position', [400 400 1000 400]);
    saveas(gcf, sprintf('../img/%splot.png', name));
    
end