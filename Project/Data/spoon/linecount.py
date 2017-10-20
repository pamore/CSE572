def lineCounter():
	fname = "1503609551913_IMU.txt"
	with open(fname) as f:
		for i, l in enumerate(f):
			pass
	return i + 1

print lineCounter()