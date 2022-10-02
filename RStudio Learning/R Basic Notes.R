# addition
1+1

# subtraction
2 - 1

#multiplication
2*2

#division
1/2

#exponents (power of)
4^4

#Order of Operations is followed in R
100 * 2 + 50/2

#remainder in a division
10 %% 8

#variable assignment
bank <- 1000

variable = 100

bank.account = 100

bankAccount = 100

#adding onto a variable
deposit = 20

bank.account = bank.account + deposit


#R Basic Data Types

#Numerics - Whole, Decimal, or Floating Point
Floatingpoint = 2.2

#Logical - Boolean (True or False)
Logical = TRUE
Logical = T
Logical = F
Logical = FALSE

#Characters/Strings
String = 'Hello'
String = "Hello"

#To Identify Class of something...
class(String)




#Vectors
#c for combined vector

#numeric vector
nvec = c(1,2,3,4,5)
nvec
class(nvec)
#character vector
cvec = c("U","S","A")
#logical vector
lvec = c(T,F)
class(lvec)

#Combining different classes into one vector
v = c(TRUE,20,40)
v
#Converts True to Numeric 1 automatically
#Tries to keep vectors singular-class
v2  = c('USA',20,31)
v2
class(v2)
#This one becomes a character vector


temps = c(72,71,68,73,75,54,67)

#add days of week using the names function
names(temps) = c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
temps

#alternative way to same end
days = c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
names(temps) = days
temps


#vector operations
v1 = c(1,2,3)
v2 = c(5,6,7)
#addition adds each element together
v1 + v2

v1 - v2

v1*v2
v1/v2
v1^v2

#sum, etc
sum(v1)

mean(v1)
#standard deviation
sd(v1)

min(v1)
max(v2)

#product of all elements in a vector

prod(v1)
prod(v2)



#comparison operators
5>6
6>5
5>=6
5<=6
#check for equality
2==3
#check for inequality
2!=3

#check against a vector, works for each element
v = c(1,2,3,4,5)
v > 2

v2 = c(10,20,30,40,50)
#compare vector vs vector, element by element basis
v < v2


#vector indexing and slicing
v1 = c(100,200,300)
v2 = c('a','b','c')
#indexing - starts at 1
v1[1]
v2[2]
v1[c(1,2)]
v2[c(1,3)]

#slicing - grabbing a slice of a vector
v3 = c(1,2,3,4,5,6,7,8,9,10)
v3[2:4]

v = c(1,2,3,4)
names(v) = c('a','b','c','d')
#returns with name
v[2]
#can go out of order
v[c('c','d','a')]
#filter out values less than... 2
v[v>2]
v
#basically passing in a logical vector (as below)
v>2
myfilter = v>2
v[myfilter]
