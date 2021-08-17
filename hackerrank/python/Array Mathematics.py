import numpy
n,m = map(int,input().split())

x = numpy.array([input().split() for _ in range(n)], dtype = int)
y = numpy.array([input().split() for _ in range(n)], dtype = int)
print(x+y)
print(x-y)
print(x*y)
print(x//y)
print(x%y)
print(x**y)
