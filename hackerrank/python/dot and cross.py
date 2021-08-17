import numpy
n = int(input())
x = numpy.array([input().split() for i in range(n)],int)
y = numpy.array([input().split() for i in range(n)],int)
print(numpy.dot(x,y))
