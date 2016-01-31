matrix1 = [
			[1, 2, 3, 4, 5],
			[6, 7, 8, 9, 10],
			[11, 12, 13, 14, 15],
			[16, 17, 18, 19, 20],
			[21, 22, 23, 24, 25, 26],
			[27, 28, 29, 30, 31, 32],
			[33, 34, 35, 36, 37, 38]
		]

matrix2 = [
			[1, 2, 3, 4, 5],
			[6, 7, 8, 9, 10],
			[11, 12, 13, 14, 15],
			[16, 17, 18, 19, 20],
			[21, 22, 23, 24, 25, 26],
			[27, 28, 29, 30, 31, 32],
			[1, 2, 3, 4, 5],
			[6, 7, 8, 9, 10],
			[11, 12, 13, 14, 15],
			[16, 17, 18, 19, 20],
			[21, 22, 23, 24, 25, 26],
			[27, 28, 29, 30, 31, 32]
		]

def reflect(matrix):

	rows = len(matrix)
	cols = len(matrix[0])

	horizontal_half = rows / 2
	
	i = horizontal_half
	while i < rows:
		j = 0
		while j < cols:
			matrix[i][j] = matrix[rows - i][j]
			j += 1
		i += 1
	

def print_matrix(matrix):

	rows = len(matrix)
	cols = len(matrix[0])

	print

	i = 0
	while i < rows:
		j = 0
		while j < cols:
			print str(matrix[i][j]).zfill(2), ' ',
			j += 1
		print
		i += 1


def main():
	reflect(matrix2)
	print_matrix(matrix2)

if __name__ == '__main__':
	main()