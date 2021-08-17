import numpy
n,m = map(int,input().split())

my_array = numpy.array([input().split() for i in range(n)],int)
x = (numpy.sum(my_array, axis = 0))
print(numpy.prod(x))
