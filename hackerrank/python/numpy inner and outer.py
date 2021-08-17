import numpy
array_a = list(map(int,input().split()))
array_b = list(map(int,input().split()))
print(numpy.inner(array_a,array_b))
print(numpy.outer(array_a,array_b))
