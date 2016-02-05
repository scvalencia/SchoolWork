%{
    This script, computes dynamically the value of the machine
    epsilon, executed in MATLAB/Octave. For this purpose, we use 
    the fact that the floating point representation of 1.0 + eps,
    must be bigger tan one. Then we decrease the value of eps by
    a factor of (1 / 2.0), to find the required eps.

    eps = epsilon
%}

format long;

epsilon = 1.0;
fl = 1.0 + epsilon;

while fl > 1.0
    epsilon = epsilon / 2.0;
    fl = 1.0 + epsilon;
end;

% We find the proper value, since the condition
% at the while loop increase the value of epsilon

epsilon = abs(2.0 * epsilon); 
disp(epsilon);