#1.
A = c(1,2,3)
B = c(4,5,6)

rbind(A,B)

#2
mat = matrix(1:9,nrow=3)
#3
mat
is.matrix(mat)
#4
mat2 = matrix(1:25,byrow=TRUE,nrow=5)
mat2
#5
mat2[2:3,2:3]

#6
mat2[4:5,4:5]

#7
sum(mat2)

#8
mat3 = matrix(runif(20,0,100),nrow=4)
mat3
