# Usage: python genbibtex.py > bib.tex

import os
import sys
import random

class Record(object):

	def __init__(self, bibtexid, title, author, series, year, publisher, pages):
		self.bibtexid = bibtexid
		self.title = title
		self.author = author
		self.series = series
		self.year = year
		self.publisher = publisher
		self.pages = pages

	def __str__(self):
		ans = '\\bibitem{%s} %s {\em %s.} %s. %s%s. Pags. %s.' % (self.bibtexid, self.author, \
				self.title, self.year, '' if self.series == '' else self.series + ' - ', self.publisher, self.pages.replace('-', ' - '))
		return ans		

def findbetween( s, first, last ):
    try:
        start = s.rindex(first) + len(first)
        end = s.rindex(last, start)
        return s[start:end]
    except ValueError:
        return ""

def processfile(filename):
	fileobject = open(filename, 'r')
	lines = fileobject.readlines()

	i = 0
	bibtexid, title, author, series, year, publisher, pages = '', '', '', '', '', '', ''
	records = []

	while i < len(lines):
		line = lines[i].strip()
		if '@book' in line:
			bibtexid = findbetween(line, '{', ',')
		elif 'title={' in line:
			title = findbetween(line, '{', '}')
		elif 'author={' in line:
			author = findbetween(line, '{', '}')
		elif 'series={' in line:
			series = findbetween(line, '{', '}')
		elif 'year={' in line:
			year = findbetween(line, '{', '}')
		elif 'publisher={' in line:
			publisher = findbetween(line, '{', '}')
		elif 'pages={' in line:
			pages = findbetween(line, '{', '}')
		elif line == '}':
			record = Record(bibtexid, title, author, series, year, publisher, pages)
			bibtexid, title, author, series, year, publisher, pages = '', '', '', '', '', '', ''
			records.append(record)
		i += 1

	return records



def main():
	path = os.getcwd()
	files = [f for f in os.listdir(path) if 'txt' in f]

	sections = {}
	for f in files:
		records = processfile(f)
		random.shuffle(records)
		sections[f] = records

	for f in files:
		fname = f[:f.index('.')] 
		print '% ' + fname.capitalize() + ' Bibliography'
		print

		for record in sections[f]:
			print record
			print

if __name__ == '__main__':
	main()
