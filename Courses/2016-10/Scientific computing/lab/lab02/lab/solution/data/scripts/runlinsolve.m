TIMES = 10;
dimension = 500;

format long;

m = zeros(7);
e = zeros(7);

for i=1:TIMES
    [measurements, errors] = linmeasurement(dimension);
    m = m + measurements;
    e = e + errors;
end;

m = m ./ TIMES;
e = e ./ TIMES;

plotter(e, parula, 'E');
set(gcf, 'Position', [400 400 700 700]);
saveas(gcf, '../img/plotlinsolve_error.png');

plotter(m, winter, 'M');
set(gcf, 'Position', [400 400 700 700]);
saveas(gcf, '../img/plotlinsolve_times.png');    