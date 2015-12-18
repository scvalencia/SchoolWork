import random

SMALL = 10
MEDIUM = 100
BIG = 1000

def write_set(file_object, lst, bound):
    i = 0
    while i < bound:
        M, N = random.choice(lst), random.choice(lst)

        file_object.write(str(M) + ' ' + str(N) + '\n')

        j = 0
        print M, N
        while j < M:
            string = ''.join(random.SystemRandom().choice(['0', '1']) for _ in range(N))
            file_object.write(string + '\n')
            j += 1

        i += 1

def generate_file(bound):
    file_name = '../data/ProblemaAGeneral.in'
    file_object = open(file_name, 'w')

    small_list = [_ for _ in range(1, SMALL + 1)]
    medium_list = [_ for _ in range(1, MEDIUM + 1)]
    big_list = [_ for _ in range(1, BIG + 1)]

    write_set(file_object, small_list, bound)
    write_set(file_object, medium_list, bound)
    write_set(file_object, big_list, bound)

    file_object.write(str(0) + ' ' + str(0) + '\n')


generate_file(100)