from itertools import product

def permutations(iterable, r=None):
	pool = tuple(iterable)
	n = len(pool)
	r = n if r is None else r
	for indices in product(range(n), repeat=r):
		if len(set(indices)) == r:
			yield tuple(pool[i] for i in indices)


s = set(permutations('BBBBBBRRRR', 3))

for itm in s:
	if itm.count('R') == 2:
		print itm

