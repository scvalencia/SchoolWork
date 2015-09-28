def mealy(string):
	for i, ch in enumerate(string):
		ch = int(ch)
		if i + ch < 10:
			print (i + ch) % 10,
		else:
			print (i + ch + 1) % 10,

if __name__ == '__main__':
	mealy("4247652")