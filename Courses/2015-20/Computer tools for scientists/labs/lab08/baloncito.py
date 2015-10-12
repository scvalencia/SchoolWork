#!/usr/bin/python

class Balon:
	'Este balon se mueve mediante el metodo de Euler'
	g=9.8 #aceleracion gravitacional
	def __init__(self, y0, Vy0, m0):
		self.y=y0
		self.Vy=Vy0
		self.m=m0
	def calculaFuerza(self):
		self.Fy=-self.m*Balon.g
	def muevete(self, dt):
		self.y+=self.Vy*dt
		self.Vy+=dt*self.Fy/self.m
	def imprime(self, t):
		print t, self.y

#pelota=Balon(0.0, 4.0, 0.453)
#pelota.calculaFuerza()
#t=0.0
#Deltat=0.01
#while t<1.0:
#	print t, getattr(pelota, 'y')  #pelota.imprime(t)
#	pelota.muevete(Deltat)
#	t+=Deltat
