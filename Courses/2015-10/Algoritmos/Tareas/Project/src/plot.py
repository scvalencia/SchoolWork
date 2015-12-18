def process_file(file_object, new_file_name, sizes):
    new_fo = open(new_file_name, 'w')
    new_fo.write('INPUT,TIME,RESULT1, RESULT2' + '\n')
    ans = []

    i = 0

    for line in file_object:
        parse = line.split()
        time, r1, r2 = parse[2], parse[0], parse[1]
        new_fo.write(sizes[i] + ',' +  time + ',' + r1 + ',' + r2 + '\n')

        ans.append(sizes[i], time)

        i += 1

        if i == 200:
            break

    return ans


def main():
    file_object0 = open('../data/ProblemaAGeneral_0.out')
    file_object1 = open('../data/ProblemaAGeneral_1.out')

    sizes = open('../data/sizes.txt').readlines()[:200]
    sizes = [_.strip() for _ in sizes]

    new_size = []

    for itm in sizes:
        parse = itm.split()
        a, b = int(parse[0]), int(parse[1])
        new_size.append(str(a * b))

    ans0 = process_file(file_object0, '../data/Measure0.csv', new_size)
    ans1 = process_file(file_object1, '../data/Measure1.csv', new_size)

main()

