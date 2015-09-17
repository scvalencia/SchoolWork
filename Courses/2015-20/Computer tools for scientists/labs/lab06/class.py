def fibonacci(n):
	return n if n < 2 else fibonacci(n - 2) + fibonacci(n - 1)


for i in range(10):
	print i, fibonacci(i)