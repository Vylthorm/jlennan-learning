#LOGICAL OPERATORS
# & AND
# | OR
# ! NOT
x = 10
x < 20
x > 5
x < 20 & x > 5
(x < 20) & (x > 5)
(x < 20) & (x > 5) & (x==10)
(x < 20) & (x > 5) & (x==9)
#returns true below
TRUE & TRUE
#returns false
TRUE & FALSE
#OR operator usage
(x == 100) | (x == 10)

# ! Not usage
(10 == 1)
!(10 == 1)
#Could stack Not Operators, but not very useful
!!(10 == 1)

df = mtcars
head(df)

df[df$mpg > 20,]
#same result, using subset
subset(df,mpg>20)

#combining filters w/ logical operators

df[(df$mpg > 20)&(df$hp>100),]


#if, else, else if statements
#if
#else if
#else

if (x==10){
 #code that executes if true
  print('x is equal to 10')
}else if (x==12){
  print('x equal 12')
}else{
  print('x not equal to 10 or 12')
}
x

#while loops - continuously run code until condition is made true
print('just a string')
var = 'a variable'
cat('my variable is: ',var)

var = 25
cat('my variable is: ',var)

#alternative:
print(paste0('Variable is: ',var))

x = 0
while(x<10){
  cat('x is currently: ',x)
  print('x is still less than 10, adding 1 to x')
  
  #add the one to x
  x = x + 1
}

#adding an if statement

x = 0
while(x<10){
  cat('x is currently: ',x)
  print('x is still less than 10, adding 1 to x')
  
  #add the one to x
  x = x + 1
  if (x==10){
    print('x is equal to 10, terminating loop')
  }
}

#break allows us to terminate out of a loop

x = 0

while(x < 10){
  
  cat('x is currently: ',x)
  print(' x is still less than 10, adding 1 to x')
  
  # add one to x
  x = x+1
  if(x==10){
    print("x is equal to 10!")
    print("I will also print, woohoo!")
  }
}


while(x < 10){
  
  cat('x is currently: ',x)
  print(' x is still less than 10, adding 1 to x')
  
  # add one to x
  x = x+1
  if(x==10){
    print("x is equal to 10!")
    break
    print("I will also print, woohoo!")
  }
}


#for loops - iterate over an object like a vector, 
#executing code for every loop gone through

vec = c(1,2,3,4,5)

for (temp_var in vec){
  print(temp_var)
}

#alternative way of looping through



for (i in 1:length(vec)){
  print(vec[i])
}

#with a list


li <- list(1,2,3,4,5)



for (temp_var in li){
  print(temp_var)
}



for (i in 1:length(li)){
  print(li[[i]]) 
  # Remember to use double brackets!
}



#matrix 

mat <- matrix(1:25,nrow=5)
mat



for (num in mat){
  print(num)
}

#nested loops
for (row in 1:nrow(mat)){
  for (col in 1:ncol(mat)){
    print(paste('The element at row:',row,'and col:',col,'is',mat[row,col]))
  }
}


#Introduction to Functions
#Functions - group of statements set to be run more than once
#AKA - call function, rather than writing same code 20x

help(sum)
#pay attention to arguments that function take in
#sum documentation - ... = numeric/...,na.rm = remove missing values?

#how do we create the format ourselves?
#from:
#name_of_function(input1,input2,....)

name_of_function <- function(arg1,arg2,...){
  # Code that gets executed when function is called
}


hello = function(){
  print('hello')
}
hello()

helloyou = function(name){
  print(paste('hello ',name))
}

helloyou('Sammy')



add_num <- function(num1,num2){
  print(num1+num2)
}



add_num(5,10)




hello_someone <- function(name='Frankie'){
  print(paste('Hello ',name))
}
#uses the default that was assigned in function
hello_someone()



# overwrite default
hello_someone('Sammy')


#returning values


formal <- function(name='Sam',title='Sir'){
  return(paste(title,' ',name))
}

formal()



formal('Issac Newton')


#Since we are returning, we can assign this to a variable
var <- formal('Marie Curie','Ms.')

var


#Scope - A variable is defined only inside a function,
#then it's scope is limited to that function



# Multiplies input by 5
times5 <- function(input) {
  result <- input ^ 2
  return(result)
}







v = "I'm global v"
stuff <- "I'm global stuff"

fun <- function(stuff){
  print(v) 
  stuff <- 'Reassign stuff inside func'
  print(stuff)
}





print(v) #print v
print(stuff) #print stuff
fun(stuff) # pass stuff to function
# reassignment only happens in scope of function
print(stuff)


double <- function(a) {
  a <- 2*a
  a
}
var <- 5
double(var)
var
