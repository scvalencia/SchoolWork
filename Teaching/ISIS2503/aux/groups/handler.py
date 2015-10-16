# -*- coding: utf-8 -*-
import tabulate
import csv, codecs, cStringIO

class Student(object):

	def __init__(self, last_name, id, email, group):
		self.last_name = last_name
		self.id = id
		self.email = email
		self.group = int(group)
		self.grade = 0.0

	def __str__(self):
		ans = str(self.last_name)
		ans += ', ' + str(self.id)
		ans += ', ' + str(self.email)
		ans += ', ' + str(self.group)
		ans += ', ' + str(self.grade)
		return ans

students = []

def report_students():
	headers = ['APELLIDO', 'CODIGO', 'EMAIL', 'GRUPO', 'NOTA']
	print ', '.join(headers)
	for s in students:
		print s.last_name.strip(), ', ', s.id.strip(), ', ', s.email.strip(), ', ', s.group, ', ', s.grade

def set_students():
	groups = {}
	with open('201520.csv', 'rb') as csvfile:
		reader = csv.DictReader(csvfile)
		for row in reader:
			name = row['Nombre'].split()[0:2]
			group = row['Grupo']
			if group in groups:
				groups[group].append(name[0] + ' ' + name[1])
			else:
				groups[group] = [name[0] + ' ' + name[1]]


	codes = {}
	with open('codes.csv', 'rb') as csvfile2:
		reader = csv.DictReader(csvfile2)
		for row in reader:
			name = row['Apellidos                     '].split()
			id = row['Carnet         ']
			email = row['E-mail']
			total_name = name[0] + ' ' + name[1]
			codes[id] = (total_name, email)

	code_keys = codes.keys()

	global students

	for group in groups:
		ss = groups[group]
		while ss:
			current = ss.pop()
			candidates = []
			new_dct = codes
			i = 0
			for code in code_keys:
				name, email = codes[code]
				if name == current:
					students.append(Student(name, code, email, group))
					code_keys.pop(i)
				i += 1

def set_grade(group, grade, code = None):
	if code:
		student = filter(lambda x : x.id == code, students).pop()
		student.grade = grade if grade != 0.0 else student.grade
		
	else:
		students_per_group = filter(lambda x : x.group == int(group), students)
		for student in students_per_group:
			student.grade = grade if grade != 0.0 else student.grade

if __name__ == '__main__':
	set_students()
	groups = [str(i) for i in range(1, 10)]

	
	while True:
		input_group = raw_input()		
		le = len(input_group)
		if le == 9:
			grade = input()
			set_grade(0, grade, input_group)
		elif input_group in groups:
			grade = input()
			set_grade(input_group, grade)
		else:
			break
	
	report_students()