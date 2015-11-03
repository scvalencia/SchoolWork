import random

def gen_new_input():
	n = random.randint(0, 12)
	m = random.randint(0, 5)

	word = 'a' * n + 'b' * (n * m) + str(m)

	return word if len(word) != 1 else ''

i = 0
while i < 40:
	print gen_new_input()
	i += 1