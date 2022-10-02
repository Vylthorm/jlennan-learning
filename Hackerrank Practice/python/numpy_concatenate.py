import numpy
n,m,p = list(map(int,input().split()))
output = [list(map(int,input().split()))]
for i in range(n+m-1):
    output = numpy.concatenate((output, [list(map(int,input().split()))]), axis = 0)   
print(output)
