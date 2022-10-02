#0
x = 1
if(x == 1){
  print('Hello')
}

#1
x = 1
x = 2
if (x%%2 == 0){
  print('even number')
}else{
  print('Not Even')
}

#2
x = matrix(c(1:14),nrow=2)
is.matrix(x)
x
if (is.matrix(x)){
  print('Is a matrix')
}else{
  print('Not a matrix')
}

#3
x = c(3,7,1)
is.vector(x)
x
if (length(x) == 3){
  x[order(x,decreasing=TRUE)]
}

#intended method using if, else if, and else
x <- c(3,7,1)

if (x[1] > x[2]){
  fir <- x[1]
  sec <- x[2]
} else {
  fir <- x[2]
  sec <- x[1]
}
if ( x[3] > fir & x[3] > sec ) {
  thi <- sec
  sec <- fir
  fir <- x[3]
} else if ( x[3] < fir & x[3] < sec ) {
  thi <- x[3]
} else {
  thi <- sec
  sec <- x[3]
}

print(paste(fir, sec, thi))

#4
x <- c(20, 10, 1)

if (x[1] > x[2] & x[1] > x[3] ) {
  print(x[1] )
} else if (x[2] > x[3] ) {
  print(x[2])
} else {
  print(x[3])
}
