import numpy
n = int(input())
a = numpy.array([input().split() for i in range(n)],float)
x = round(numpy.linalg.det(a),2)
print(x)
