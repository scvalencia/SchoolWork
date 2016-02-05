# -*- coding: utf-8 -*-

import os
import sys
import signal
import random
import threading
import subprocess

AUDIO_PATH = '/audio'
TEX_PATH = '/tex'

ps = None

class ProcessHandler(threading.Thread):

    def __init__(self, filepath):

        self.stdout = None
        self.stderr = None
        self.filepath = filepath
        threading.Thread.__init__(self)

    def run(self):
    	global ps

        ps = subprocess.Popen(["afplay", self.filepath], shell=False, 
        	stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        self.stdout, self.stderr = ps.communicate()

class MusicPiece(object):

	def __init__(self, author, year, original_name, spanish_name, file_path):

		self.author = author
		self.year = year
		self.original_name = original_name
		self.spanish_name = spanish_name
		self.file_path = file_path

	def attributes(self):
		author = self.author
		year = self.year
		original_name = self.original_name
		spanish_name = self.spanish_name
		file_path = self.file_path

		return [author, year, original_name, spanish_name, file_path]

	def __str__(self):
		ans = ''

		attributes = self.attributes()
		for attribute in attributes:
			ans += attribute + '\n'

		return ans

def get_pieces():
	current_path = os.getcwd()
	os.chdir(current_path + AUDIO_PATH)
	composers = [folder for folder in os.listdir(os.getcwd()) if folder[0] != '.']

	current_path = os.getcwd()
	pieces = {}

	for composer in composers:
		composer_path = current_path + '/' + composer
		os.chdir(composer_path)

		composer_pieces = [filename for filename in os.listdir(composer_path)]

		for piece in composer_pieces:
			pieces[os.path.splitext(piece)[0]] = composer_path + '/' + piece

	os.chdir('../..')
	return pieces

def parse_piece(line):
	author =  line[line.index('\\textbf{') + len('\\textbf{') : line.index('}')].strip()
	line = line[line.index('}') + 1:]
	year = line[line.index('(') + 1 : line.index(')')].strip()
	line = line[line.index(')') + 1:]
	original_name = line[line.index('\\textit') + len('\\textit') + 1 : line.index('}')].strip()
	line = line[line.index('}') + 1:]
	line = line[line.index('}') + 1:]
	spanish_name = line[line.index('%%{') + len('%%{') : line.index('}')].strip()

	return author, year, original_name, spanish_name

def parse_texfile():
	current_path = os.getcwd()
	os.chdir(current_path + TEX_PATH)

	texfile = open('pieces.tex', 'r')
	pieces = {}

	section = ''

	for line in texfile:
		if '\section' in line:
			section = line[line.index('{') + 1 : line.index('}')]
			pieces[section] = []
		if '\item \\textbf{' in line:
			line = line.strip()
			author, year, original_name, spanish_name = parse_piece(line)
			pieces[section].append((author, year, original_name, spanish_name))

	lexemes = pieces
	return lexemes

def main():

	flags = {'-p' : 'Primer parcial', '-s' : 'Segundo parcial', '-t' : 'Tercer parcial'}
	pieces = get_pieces()
	lexemes = parse_texfile()

	selection = sys.argv[1]

	music_pieces = []

	for piece in lexemes[flags[selection]]:
		author, year, original_name, spanish_name = piece
		file_path = pieces[original_name]

		music_pieceobject = MusicPiece(author, year, original_name, spanish_name, file_path)
		music_pieces.append(music_pieceobject)

	random.shuffle(music_pieces)

	flag = True
	correct = 0
	total = 0

	for piece in music_pieces:	

		if flag:
			total += 1
			process = ProcessHandler(piece.file_path)
			process.start()

			correct_author = piece.author.lower()
			correct_spanishname = piece.spanish_name.lower()
			correct_year = piece.year.lower()

			tries = 0
			correct_input = [correct_author, correct_spanishname, correct_year]
			correct_output = [piece.author, piece.spanish_name, piece.year]

			while True:
				print 'Introduce the name as (Author, Spanish name, Year).'
				line = raw_input('>> ')
				try:
					if line == 'next':
						print '*' * 13 * 6
						print 'AUTHOR: ', correct_output[0]
						print 'NAME: ', correct_output[1]
						print 'YEAR: ', correct_output[2]
						print '*' * 13 * 6

						ps.kill()
						break

					if line == 'exit':
						ps.kill()
						flag = False
						break

					if line == 'play':
						ps.kill()
						process = ProcessHandler(piece.file_path)
						process.start()

					if ',' not in line:
						print 'WRONG INPUT FORMAT'
					else:
						parse = line.split(',')
						if len(parse) == 3:

							author, spanish_name, year = tuple(line.split(','))
							author = author.strip().lower()
							spanish_name = spanish_name.strip().lower()
							year = year.strip().lower()

							if [author, spanish_name, year] == correct_input:
								print 'CORRECT'
								correct += 1
								ps.kill()
								break
							else:
								tries += 1
								print 'WRONG!'

								if tries == 5:
									print '*' * 13 * 6
									print 'AUTHOR: ', correct_output[0]
									print 'NAME: ', correct_output[1]
									print 'YEAR: ', correct_output[2]
									print '*' * 13 * 6

									ps.kill()
									break

						else:
							print 'WRONG INPUT FORMAT'

				except:
					ps.kill()
					break				

			process.join()

	print 'SCORE: ', (correct + 0.0) * 100 / total

if __name__ == '__main__':
	main()