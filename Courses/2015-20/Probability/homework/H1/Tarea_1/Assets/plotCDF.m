j = 0;
for i = 1:size(x, 1)
    if(i == 1)
      x_a = x(i)-50:0.01:x(i);
      y_a = zeros(size(x_a));
    else
      x_a = x(i-1):0.01:x(i);
      y_a = ones(size(x_a))*j;
      plot(x_a(1), y_a(1), 'o','MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]);
      hold on;
    end
    plot(x_a, y_a, 'r-');
    hold on;
    plot(x_a(end), y_a(end), 'ko', 'MarkerFaceColor',[1.0 1.0 1.0]);
    hold on;
    j = j + y(i);
    if(j == 1)
      x_a = x(end):0.01:x(end)+40;
      y_a = ones(size(x_a));
      plot(x_a, y_a, 'r-');
      hold on;
      plot(x_a(1), y_a(1), 'o','MarkerEdgeColor','k','MarkerFaceColor',[0 0 0]);
      hold on;
    end
end
