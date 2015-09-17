import os
import re
import zipfile

mypath = os.getcwd()

def process_folder(folder):

	mypath = os.getcwd() + '/' + folder

	onlyfiles = [f for f in os.listdir(mypath) if os.path.isfile(os.path.join(mypath,f))]
	dct = {}

	for f in onlyfiles:
		match = re.search(r'[a-z]+.[a-z]+[0-9]+', f)
		if match:
			name = match.group()
			if name in dct:
				dct[name].append(f)
			else:
				dct[name] = [f]

	for itm in dct:
		try: 
			os.mkdir(mypath + '/' + itm)
		except:
			continue
		for f in dct[itm]:
			os.rename(mypath + '/' + f, mypath + '/' + itm + '/' + f)
			unzip(folder + '/' + itm)

def unzip(folder):
	mypath = os.getcwd() + '/' + folder

	for f in os.listdir(mypath):
		if os.path.isfile(os.path.join(mypath,f)):
			filename, file_extension = os.path.splitext(f)
			if file_extension == '.zip':
				with zipfile.ZipFile(mypath + '/' + f, "r") as z:
					z.extractall(mypath)

				os.remove(mypath + '/' + f)

def main():
	sicua_activities = []

	act = input('Introduzca el numero de actividades: ')
	i = 0
	while i < act:
		current = raw_input('Nombre de la carpeta: ')
		sicua_activities.append(current)
		if not os.path.isdir(mypath + '/' + current):
			print 'ERROR: El archivo no es un directorio'
			if len(sicua_activities) != 0:
				print 'Las carpetas fueron: '
				for itm in sicua_activities:
					print itm
				break
		else:
			process_folder(current)
		i += 1

if __name__ == '__main__':
	main()