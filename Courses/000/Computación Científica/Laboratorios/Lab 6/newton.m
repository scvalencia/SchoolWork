clear all; clc;
syms x y h s;
sol = [1 1]; % x0, y0
Z0ep = 52.895;
Z0op = 47.263;
error = 1;
% Condiciones Iniciales
Z0 = sqrt(Z0ep*Z0op);
k0 = (Z0ep-Z0op)/(Z0ep+Z0op);
sol(1) = 4*exp(-Z0/(59.952*sqrt(0.987-0.171*k0-1.723*k0^3)))/pi;
r = (4/(pi*sol(1)))^(0.001+1.117*k0-0.683*k0^2);
sol(2) = log((r+1)/(r-1)) - sol(1);

d = 0.11 - 0.83*y + 1.64*y^2 - y^3;
a = 1 + exp(16*x - 18.272);
b = sqrt(5.905-x^4);
c = -0.8107*y^3 + 1.3401*y^2 - 0.6929*y + 1.0892 + 0.014002/y - 0.000636/(y^2);
e = -0.15*exp(-13*x);
g = 2.23*exp(-7.01*y + 10.24*y^2 - 27.58*y^3);
k = 1 + 0.01*(-0.0726 - 0.2145/y + 0.222573/(y^2) - 0.012823/(y^3));
l = 0.01*(-0.26 + 0.6866/y + 0.0831/(y^2) - 0.0076/(y^3));
m = -0.1098 + 1.2138*x - 2.2535*x^2 + 1.1313*x^3;
n = -0.019 - 0.016/y + 0.0362/(y^2) - 0.00234/(y^3);

f1 = x*a/b;
f3 = tanh(pi*(x+y)/2);

% Caso 1
f2_1 = c - x*d + e*g;
f4_1 = k - x*l + m*n;
Z0e_1 = 59.952*log(0.523962/f1*f2_1*f3);
Z0o_1 = 59.952*log(0.523962*f3/f1*f4_1);
V1_1 = Z0e_1 - Z0ep;
V2_1 = Z0o_1 - Z0op;
J_1 = jacobian([V1_1, V2_1], [x,y]);
eq1 = double(subs((J_1^-1), {x,y}, sol))*double(subs([V1_1;V2_1], {x,y}, sol));

% Caso 2
f2_2 = 1 + 0.004*exp(0.9-y);
f4_2 = 1;
Z0e_2 = 59.952*log(0.523962/f1*f2_2*f3);
Z0o_2 = 59.952*log(0.523962*f3/f1*f4_2);
V1_2 = Z0e_2 - Z0ep;
V2_2 = Z0o_2 - Z0op;
J_2 = jacobian([V1_2, V2_2], [x,y]);
eq2 = double(subs((J_2^-1), {x,y}, sol))*double(subs([V1_2;V2_2], {x,y}, sol));

while error > 0.7/100
    if sol(2) < 0.9 % y0
        new_sol = sol' - eq1';
        J = J_1;
    else
        new_sol = sol' - eq2;
        J = J_2;
    end
    
    double(subs(J, {x,y}, sol))
    error = abs(sol-new_sol');
    sol = new_sol;
end
