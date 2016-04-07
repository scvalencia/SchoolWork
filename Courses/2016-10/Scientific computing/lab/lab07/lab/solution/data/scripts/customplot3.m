figure
subplot(2, 1, 1);
plot(eval, f3simp, 'b');
title('Integal de $$f(\tau) = \cos\!\left({\mathrm{\tau}}^2\right)$$. Obtenida usando la funci\''on $$\texttt{quad()}$$ (Regla de Simpson).', 'interpreter', 'latex');
h = legend('$$C_1(x) = \int_{0}^{x} f(\tau)\ d\tau$$');
set(h,'Interpreter','latex')
grid on;
xlabel('$$x \in {\rm I\!R}$$', 'interpreter', 'latex')
ylabel('$$C_1(x)\ :\ {\rm I\!R} \rightarrow {\rm I\!R}$$', 'interpreter', 'latex')

subplot(2, 1, 2);
plot(eval, f3trap, 'r')
title('Integal de $$f(\tau) = \cos\!\left({\mathrm{\tau}}^2\right)$$. Obtenida usando la funci\''on $$\texttt{trapz()}$$ (Regla del trapecio).', 'interpreter', 'latex');
h = legend('$$C_1(x) = \int_{0}^{x} f(\tau)\ d\tau$$');
set(h,'Interpreter','latex')
grid on;
xlabel('$$x \in {\rm I\!R}$$', 'interpreter', 'latex')
ylabel('$$C_1(x)\ :\ {\rm I\!R} \rightarrow {\rm I\!R}$$', 'interpreter', 'latex')

saveas(gcf, '../img/f3intplot0001.png');