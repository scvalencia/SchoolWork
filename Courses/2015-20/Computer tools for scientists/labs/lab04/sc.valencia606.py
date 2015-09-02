# sin(x) = x - x3^/3! + x^5/5! - x^7/7! + x^9/9! - ...

import math

x = math.pi / 6
sin_real = math.sin(x)

EPSILON = 0.001
ans = 0.0
n = 0

while (abs(sin_real - ans) >= EPSILON):
	# Computing factorial
	fct = 1
	for i in range(1, 2 * n + 2):
		fct *= i
	# Computing sin(x)
	ans += ((-1) ** n) * (x ** (2 * n + 1) / fct)
	n += 1

print n