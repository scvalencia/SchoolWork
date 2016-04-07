figure
subplot(2, 1, 1);
plot(eval, f1simp, 'r');
title('Integal de $$f(\tau) = \cos\!\left(\frac{\pi\, {\mathrm{\tau}}^2}{2}\right)$$. Obtenida usando la funci\''on $$\texttt{quad()}$$ (Regla de Simpson).', 'interpreter', 'latex');
h = legend('$$C(x) = \int_{0}^{x} f(\tau)\ d\tau$$');
set(h,'Interpreter','latex')
grid on;
xlabel('$$x \in {\rm I\!R}$$', 'interpreter', 'latex')
ylabel('$$C(x)\ :\ {\rm I\!R} \rightarrow {\rm I\!R}$$', 'interpreter', 'latex')

subplot(2, 1, 2);
plot(eval, f1trap, 'b')
title('Integal de $$f(\tau) = \cos\!\left(\frac{\pi\, {\mathrm{\tau}}^2}{2}\right)$$. Obtenida usando la funci\''on $$\texttt{trapz()}$$ (Regla del trapecio).', 'interpreter', 'latex');
h = legend('$$C(x) = \int_{0}^{x} f(\tau)\ d\tau$$');
set(h,'Interpreter','latex')
grid on;
xlabel('$$x \in {\rm I\!R}$$', 'interpreter', 'latex')
ylabel('$$C(x)\ :\ {\rm I\!R} \rightarrow {\rm I\!R}$$', 'interpreter', 'latex')

saveas(gcf, '../img/f1intplot0001.png');