file_object = open('sample.txt', 'r')

for line in file_object.readlines():
	line = line.strip()
	print line, 'Reject' if 'baobab' in line else 'Accept'