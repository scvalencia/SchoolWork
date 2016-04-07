u = [ 1 2 3 4]; % defines the polynomial x^3 + 2*x^2 + 3*x + 4 pointed by u
v = [10 20 30]; % defines the polynomial 10*x^2 + 20*x + 30 pointed by v

c = conv(u, v); % polynomial product between u and v
[q, r] = deconv(c, u);  % quotient and remainder of long division between c and u