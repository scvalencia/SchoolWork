import random
import baloncito
import matplotlib.pyplot as plt

def drange(start, stop, step):
    r = start
    while r < stop: 
        yield r
        r += step

test_cases = [(0.0, _, i) for _ in range(0, 5) for i in drange(0.1, 0.5, 0.01)]

deltas = [0.0001, 0.001, 0.01, 0.1, 0.2, 0.5, 1, 1.5, 2.0]
responses = []

for a, b, c in test_cases:
    balon_object = baloncito.Balon(a, b, c)
    balon_object.calculaFuerza()
    t = 0.0
    i = 0
    this = []
    while i < len(deltas):
        balon_object.muevete(deltas[i])
        t += deltas[i]
        i += 1
        this.append(getattr(balon_object, 'y'))

    responses.append(this)


for _ in responses:
    plt.plot(deltas,_,'r')

plt.show()    