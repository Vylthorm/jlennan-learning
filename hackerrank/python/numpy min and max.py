import numpy
n,m = map(int,input().split())
x = numpy.array([list(map(int,input().split())) for i in range(n)],int)
y = numpy.min(x, axis = 1)
print(numpy.max(y))


