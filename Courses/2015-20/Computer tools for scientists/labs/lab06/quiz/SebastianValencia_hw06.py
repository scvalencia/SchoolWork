'''
	1071	462
	462		147
	147		21
	21		0
'''
def gcd(a, b):
	return a if b == 0 else gcd(b, a % b)


print gcd(1071, 462)