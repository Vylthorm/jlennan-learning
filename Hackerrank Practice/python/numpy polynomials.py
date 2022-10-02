import numpy

p_coefficients = list(map(float,input().split()))
x = int(input())

print(numpy.polyval(p_coefficients,x))
