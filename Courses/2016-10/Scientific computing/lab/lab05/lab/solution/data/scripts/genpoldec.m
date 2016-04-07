h = conv(f, g);             % Product between f(x) and g(x)
[kq kr] = deconv(f, g);     % Division between f(x) and g(x)
v = polyder(g);             % Derivative of g(x)
