import numpy
n,m = map(int,input().split())
for i in range(n):
    x = numpy.array([input().split()], dtype = int)
    y = numpy.array([input().split()], dtype = int)
    print(x+y)
    print(x-y)
    print(x*y)
    print(x//y)
    print(x%y)
    print(x**y)
