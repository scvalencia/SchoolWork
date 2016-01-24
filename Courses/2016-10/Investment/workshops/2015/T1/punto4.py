import sys
import random
import numpy as np
import matplotlib.pyplot as plt
from numpy.random import normal

MAX = 45

dct = {
	0 : -300
}

def set_first_periord():
	i = 1
	while i <= 5:
		dct[i] = dct[i - 1] + 50
		i += 1

def set_scnd_period():
	dct[6] = 108
	i = 7
	while i <= 13:
		dct[i] = (0.12 * dct[i - 1]) + dct[i - 1]
		i += 1

def set_third_period():
	i = 14
	while i <= (13 + 12):
		dct[i] = dct[i - 1] - (0.08 * dct[i - 1])
		i += 1

def set_last_period(arg):
	i = 26
	while i <= arg:
		dct[i] = dct[i - 1] + (dct[i - 1] * 0.05)
		i += 1

def set_aux_flow1():
	new_dct = {i : 300 for i in range(0, 6)}
	plot(0, 5, new_dct)

def set_aux_flow2():
	new_dct = {0 : 0.0001}
	d = 50
	i = 1
	while i <= 5:
		new_dct[i] = 50 + new_dct[i - 1]
		i += 1
	plot(0, 5, new_dct)

def set_aux_flow3():
	new_dct = {0 : 0.0001}
	d = 50
	i = 1
	while i <= 5:
		new_dct[i] = 50
		i += 1
	plot(0, 5, new_dct)

def set_aux_flow4():
	new_dct = {0 : 0.0001, 1 : 0.00001}
	d = 50
	i = 2
	while i <= 5:
		new_dct[i] = 50 + new_dct[i - 1]
		i += 1
	plot(0, 5, new_dct)


def set_flow(arg):
	set_first_periord()
	set_scnd_period()
	set_third_period()
	set_last_period(arg)

def plot(arg_min, arg_max, arg_dct = dct):
	set_flow(arg_max)
	real_dct = {}
	real_range = range(arg_min, arg_max + 1)

	for i in real_range:
		real_dct[i] = arg_dct[i]

	x = np.linspace(0, 10, 100)
	y = normal(0, 1, 100)
	bar_width = (max(x) - min(x))/len(x)
	plt.grid()
	plt.bar(range(arg_min, arg_max + 1), real_dct.values(), bar_width, facecolor='orange')
	plt.show()

def main():
	a = int(sys.argv[1])
	b = int(sys.argv[2])
	plot(a, b)

set_aux_flow4()