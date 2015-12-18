datos = csvread('data.csv');

meses = table(:,1); % [-]
datos(:,1) = [];

x = meses + 0.5;
x(length(x)) = [];

% Los datos se organizan as�:
% Precipitaci�n | T_media | T_max | T_min | Dias lluvia | Brillo | Humedad
headers = {'Precipitaci�n' , 'T_media' , 'T_max' , 'T_min' , 'Dias lluvia' , 'Brillo' , 'Humedad'};

% Interpolaci�n lineal (linear)
linear = interp1(meses, datos, x, 'linear');

% Interpolaci�n c�bica a trozos (cubic)
cubic = interp1(meses, datos, x, 'cubic');

% Interpolaci�n con splines c�bicos (spline)
sp = interp1(meses, datos, x, 'spline');

% Interpolaci�n valor m�s cercano (nearest)
near = interp1(meses, datos, x, 'nearest');

csvwrite('linear.csv', linear);
csvwrite('cubic.csv', cubic);
csvwrite('sp.csv', sp);
csvwrite('near.csv', near);



