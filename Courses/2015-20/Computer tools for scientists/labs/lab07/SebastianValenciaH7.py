class Spring(object):

	def __init__(self, k, mass):
		self.t0 = 1
		self.velocity = 1
		self.acceleration = 1
		self.distance = 1
		self.constant = k
		self.mass = mass
		self.set_acceleration()

	def set_acceleration(self):
		self.acceleration = -(self.constant * self.distance) / self.mass

	def set_velocity(self, dt):
		self.set_acceleration()
		self.distance = self.velocity * dt		
		self.velocity = self.velocity + dt * self.acceleration		

	def __str__(self):
		return str(self.acceleration)


spring = Spring(0.09, 45)
time = 0
while time < 5.0:
	spring.set_velocity(time)
	print str(time) + '\t' + str(spring)
	time += 0.001
