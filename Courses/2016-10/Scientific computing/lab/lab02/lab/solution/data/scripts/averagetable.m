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
saveas(gcf, '../img/plotlinear_error.png');

plotter(m, winter, 'M');
set(gcf, 'Position', [400 400 700 700]);
saveas(gcf, '../img/plotlinear_times.png');

m = zeros(7);
e = zeros(7);

for i=1:TIMES
    [measurements, errors] = nonlinmeasurement(dimension);
    m = m + measurements;
    e = e + errors;
end;

m = m ./ TIMES;
e = e ./ TIMES;

plotter(e, parula, 'E');
set(gcf, 'Position', [400 400 700 700]);
saveas(gcf, '../img/plotnonlinear_error.png');

plotter(m, winter, 'M');
set(gcf, 'Position', [400 400 700 700]);
saveas(gcf, '../img/plotnonlinear_times.png'); 
    