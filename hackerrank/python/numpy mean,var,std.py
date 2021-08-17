import numpy
n,m = map(int,input().strip().split())
x = numpy.array([input().strip().split() for i in range(n) ], int)
print(numpy.mean(x, axis = 1))
print(numpy.var(x, axis = 0))
print(round(numpy.std(x),11))
