figure
subplot(2, 1, 1);
plot(eval, f2simp, 'k');
title('Integal de $$f(\tau) = \sin\!\left(\frac{\pi\, {\mathrm{\tau}}^2}{2}\right)$$. Obtenida usando la funci\''on $$\texttt{quad()}$$ (Regla de Simpson).', 'interpreter', 'latex');
h = legend('$$S(x) = \int_{0}^{x} f(\tau)\ d\tau$$');
set(h,'Interpreter','latex')
grid on;
xlabel('$$x \in {\rm I\!R}$$', 'interpreter', 'latex')
ylabel('$$S(x)\ :\ {\rm I\!R} \rightarrow {\rm I\!R}$$', 'interpreter', 'latex')

subplot(2, 1, 2);
plot(eval, f2trap, 'g')
title('Integal de $$f(\tau) = \sin\!\left(\frac{\pi\, {\mathrm{\tau}}^2}{2}\right)$$. Obtenida usando la funci\''on $$\texttt{trapz()}$$ (Regla del trapecio).', 'interpreter', 'latex');
h = legend('$$S(x) = \int_{0}^{x} f(\tau)\ d\tau$$');
set(h,'Interpreter','latex')
grid on;
xlabel('$$x \in {\rm I\!R}$$', 'interpreter', 'latex')
ylabel('$$S(x)\ :\ {\rm I\!R} \rightarrow {\rm I\!R}$$', 'interpreter', 'latex')

saveas(gcf, '../img/f2intplot0001.png');