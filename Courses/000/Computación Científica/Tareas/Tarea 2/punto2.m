syms x;
x0 = 0; x1 = 3; x2 = 5; x3 = 8; x4 = 13;
y0 = 0; y1 = 225; y2 = 383; y3 = 623; y4 = 993;
z0 = 75; z1 = 77; z2 = 80; z3 = 74; z4 = 72;

l0 = (x-x1)*(x-x2)*(x-x3)*(x-x4)/((x0-x1)*(x0-x2)*(x0-x3)*(x0-x4)); l0p = double(subs(diff(l0),x,x0));
l1 = (x-x0)*(x-x2)*(x-x3)*(x-x4)/((x1-x0)*(x1-x2)*(x1-x3)*(x1-x4)); l1p = double(subs(diff(l1),x,x1));
l2 = (x-x1)*(x-x0)*(x-x3)*(x-x4)/((x2-x1)*(x2-x0)*(x2-x3)*(x2-x4)); l2p = double(subs(diff(l2),x,x2));
l3 = (x-x1)*(x-x2)*(x-x0)*(x-x4)/((x3-x1)*(x3-x2)*(x3-x0)*(x3-x4)); l3p = double(subs(diff(l3),x,x3));
l4 = (x-x1)*(x-x2)*(x-x3)*(x-x0)/((x4-x1)*(x4-x2)*(x4-x3)*(x4-x0)); l4p = double(subs(diff(l4),x,x4));

h0 = (l0^2)*(1-2*l0p*(x-x0));
h1 = (l1^2)*(1-2*l1p*(x-x1));
h2 = (l2^2)*(1-2*l2p*(x-x2));
h3 = (l3^2)*(1-2*l3p*(x-x3));
h4 = (l4^2)*(1-2*l4p*(x-x4));

h0h = (l0^2)*(x-x0);
h1h = (l1^2)*(x-x1);
h2h = (l2^2)*(x-x2);
h3h = (l3^2)*(x-x3);
h4h = (l4^2)*(x-x4);

p = (h0*y0 + h0h*z0) + (h1*y1 + h1h*z1) + (h2*y2 + h2h*z2) + (h3*y3 + h3h*z3) + (h4*y4 + h4h*z4);
disp(subs(p,x,10));