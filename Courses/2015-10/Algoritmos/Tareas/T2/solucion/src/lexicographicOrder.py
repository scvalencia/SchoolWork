def cmp_lex(a, b):
	ans = 0
	if a == '':
		ans = -1

	i = 0
	while i < min(len(a), len(b)) - 1 and a[i] == b[i]:
		i = i + 1

	return ans == -1 or a[i] < b[i] 

def eq_lex(a, b, i):
	if len(a) <= i and len(b) <= i:
		return True
	elif len(a) <= i or len(b) <= i:
		return False
	else:
		if a[i] == b[i]:
			return eq_lex(a, b, i + 1)
		else:
			return False

def bin_search(lst, target):
	n = len(lst)

	low = 0
	high = n - 1
	ans = -1
	found = False

	while low <= high and not found:
		mid = (low + high) / 2
		if eq_lex(lst[mid], target, 0):
			ans = mid
			found = True
		elif cmp_lex(target, lst[mid]):
			high = mid - 1
		else:
			low = mid + 1

	return ans

def rec_bin_search(lst, low, high, target):
	
	if low > high:
		return -1
	mid = (low + high) / 2
	if eq_lex(target, lst[mid], 0):
		return mid
	if cmp_lex(target, lst[mid]):
		return rec_bin_search(lst, low, mid - 1, target)
	else:
		return rec_bin_search(lst, mid + 1, high, target)




print cmp_lex('afsdfsasda', 'afsdfsasdf')
print cmp_lex('afsdfsasda', 'afsdfs')
print cmp_lex('afsdfsasdf', 'afsdfsasda')
print cmp_lex('', 'afsdfsasda')
print cmp_lex('a', 'a')
print cmp_lex('ehyy', 'pixies')

a = ['stefano', 'plis', 'pixies', 'mind', 'where', 'armony', 'scratch', 'berg']
a.sort()
print
print a
#print bin_search(a, 'ehyy'), rec_bin_search(a, 0, len(a), 'ehyy')
print bin_search(a, 'stefano'), rec_bin_search(a, 0, len(a), 'stefano')
print bin_search(a, 'plis'), rec_bin_search(a, 0, len(a), 'plis')
print bin_search(a, 'armony'), rec_bin_search(a, 0, len(a), 'armony')
print bin_search(a, 'where'), rec_bin_search(a, 0, len(a), 'where')
