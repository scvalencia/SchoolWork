x = 0:10;
y = x;

d = diff(y)./diff(x);

plot(x,d);