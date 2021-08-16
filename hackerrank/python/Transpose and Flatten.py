import numpy
matrix_dimensions = list(map(int,input().split()))
array = []
for _ in range(matrix_dimensions[0]):
    array.append(list(map(int,input().split())))
print(numpy.transpose(array))
print(numpy.transpose(array).flatten('F'))
