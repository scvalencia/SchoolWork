import os
import sys

class Student(object):

	def __init__(self, name, last_name):
		self.name = name
		self.last_name = last_name

	def __str__(self):
		return self.name + ' ' + self.last_name

def main():
	files = os.listdir(os.getcwd())
	files = filter(lambda x : x[0] != '.', files)

	students = []
	for f in files:
		if f == 'handler.py':
			continue
		name, last_name = tuple(f.split('.'))
		index = [i for i, ch in enumerate(last_name) if ch.isdigit()][0]
		last_name = last_name[:index]
		students.append(Student(name, last_name))

	students.sort(key = lambda s : s.last_name)

	for student in students:
		print student
		raw_input()

if __name__ == '__main__':
	main()