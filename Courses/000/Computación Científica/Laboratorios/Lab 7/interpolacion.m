datos = csvread('data.csv');

meses = table(:,1); % [-]
datos(:,1) = [];

x = meses + 0.5;
x(length(x)) = [];

% Los datos se organizan así:
% Precipitación | T_media | T_max | T_min | Dias lluvia | Brillo | Humedad
headers = {'Precipitación' , 'T_media' , 'T_max' , 'T_min' , 'Dias lluvia' , 'Brillo' , 'Humedad'};

% Interpolación lineal (linear)
linear = interp1(meses, datos, x, 'linear');

% Interpolación cúbica a trozos (cubic)
cubic = interp1(meses, datos, x, 'cubic');

% Interpolación con splines cúbicos (spline)
sp = interp1(meses, datos, x, 'spline');

% Interpolación valor más cercano (nearest)
near = interp1(meses, datos, x, 'nearest');

csvwrite('linear.csv', linear);
csvwrite('cubic.csv', cubic);
csvwrite('sp.csv', sp);
csvwrite('near.csv', near);



