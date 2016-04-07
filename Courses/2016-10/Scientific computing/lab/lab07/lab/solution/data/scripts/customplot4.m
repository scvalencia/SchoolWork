figure
subplot(2, 1, 1);
plot(eval, f4simp, 'm');
title('Integal de $$f(\tau) = \sin\!\left({\mathrm{\tau}}^2\right)$$. Obtenida usando la funci\''on $$\texttt{quad()}$$ (Regla de Simpson).', 'interpreter', 'latex');
h = legend('$$S_1(x) = \int_{0}^{x} f(\tau)\ d\tau$$');
set(h,'Interpreter','latex')
grid on;
xlabel('$$x \in {\rm I\!R}$$', 'interpreter', 'latex')
ylabel('$$S_1(x)\ :\ {\rm I\!R} \rightarrow {\rm I\!R}$$', 'interpreter', 'latex')

subplot(2, 1, 2);
plot(eval, f4trap, 'k')
title('Integal de $$f(\tau) = \sin\!\left({\mathrm{\tau}}^2\right)$$. Obtenida usando la funci\''on $$\texttt{trapz()}$$ (Regla del trapecio).', 'interpreter', 'latex');
h = legend('$$S_1(x) = \int_{0}^{x} f(\tau)\ d\tau$$');
set(h,'Interpreter','latex')
grid on;
xlabel('$$x \in {\rm I\!R}$$', 'interpreter', 'latex')
ylabel('$$S_1(x)\ :\ {\rm I\!R} \rightarrow {\rm I\!R}$$', 'interpreter', 'latex')

saveas(gcf, '../img/f4intplot0001.png');