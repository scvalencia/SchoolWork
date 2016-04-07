lval = polyval(lag, 2020);
nval = polyval(new, 2020);

year2 = [1900 1920 1940];
pop2 = [76.0 105.7 131.7];

lag2 = lagrange(year2, pop2);

lag2p1 = polyval(lag2, year(4));
lag2p2 = polyval(lag2, year(5));
lag2p3 = polyval(lag2, year(6));

abserrorp1 = abs(lag2p1 - pop(4)) / pop(4);
abserrorp2 = abs(lag2p2 - pop(5)) / pop(5);
abserrorp3 = abs(lag2p3 - pop(6)) / pop(6);