definitions;        % Defining the functions 
step = 0.001;       % Defines the steps of the iteration vector for the integral
eval = 0:step:15;   % Iteration vector for the integral
n = length(eval);   % Length og vector

% Vectors for storing each integral for each item in te eval vector for
% each method
f1simp = zeros(n, 1); f1trap = zeros(n, 1);
f2simp = zeros(n, 1); f2trap = zeros(n, 1);
f3simp = zeros(n, 1); f3trap = zeros(n, 1);
f4simp = zeros(n, 1); f4trap = zeros(n, 1);

% Evaluation of each function in the iteration vector
f1y = f1(eval); f2y = f2(eval);f3y = f3(eval); f4y = f4(eval);

for i=1:n
    % Integration vector up to the currrent evaluation value
    fx = 0:step:eval(i);    
    try  
        % Trapezoidal and Simpson's rule application for each function
        f1trap(i) = trapz(fx, f1(fx)); f1simp(i) = quad(f1, 0, eval(i));
        f2trap(i) = trapz(fx, f2(fx)); f2simp(i) = quad(f2, 0, eval(i));
        f3trap(i) = trapz(fx, f3(fx)); f3simp(i) = quad(f3, 0, eval(i));
        f4trap(i) = trapz(fx, f4(fx)); f4simp(i) = quad(f4, 0, eval(i));
    catch, continue; 
    end;
end;

% Custom plotting procedures, irrelevant
customplot1; customplot2; customplot3; customplot4;