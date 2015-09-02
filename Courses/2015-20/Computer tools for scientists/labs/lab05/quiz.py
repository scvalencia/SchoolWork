'''
Count the frequency of 'Romeo' and the frequency of 'Julie' in the text
'''

file_object = open('Romeo_and_Juliet.txt', 'r')

romeo = 0
juliet = 0

for line in file_object.readlines():
	line = line.strip().lower()

	if 'romeo' in line:
		romeo += line.count('romeo')

	if 'juliet' in line:
		juliet += line.count('juliet')

print 'La palabra Romeo aparece ' + str(romeo) + ' veces.'
print 'La palabra Juliet aparece ' + str(juliet) + ' veces.'