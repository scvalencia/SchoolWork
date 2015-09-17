word = 'bbbcbbb*acc*'
n = len(word)

i = 0
while i < n:
	if i % 3 == 0:
		if word[i] == 'b': print 'a',
		elif word[i] == 'c': print 'b',
		elif word[i] == 'a': print 'c',
	elif i % 3 == 1 and word[i + 1] == word[i]:
		print word[i],
		i = i + 1
	elif i % 3 == 2:
		if word[i] == '*': print word[i - 1],
		else: print word[i],

	i += 1
