#Built in R Functions

#seq(): Create sequences
#sort(): Sort a vector
#rev(): Reverse elements in object
#str(): Show the structure of an object
#append(): Merge objects together (works on vectors and lists)



# seq(start,end,step size)
x = seq(0, 100, by = 3)
x

v =  c(1,4,6,7,2,13,2)
sort(v)
sort(v,decreasing=TRUE)

#reverse
v2 = c(1,2,3,4,5)
rev(v2)

#structure
str(v)

append(v,v2)

sort(append(v,v2))

#Data Type - Checks and Conversions

#is.*(): Check the class of an R object
#as.*(): Convert R objects

v = c(1,2,3)
is.vector(v)
is.list(v)
as.list(v)
as.matrix(v)


#Apply

#lapply() will apply a function over a list or vector:
help(lapply)

#sample 1 random num between 1:10
sample(x = 1:10,1)

v = c(1,2,3,4,5)

#our custom function
addrand = function(x){
  #get a random number
  ran = sample(x=1:10,1)
  
  #return x plus random number
  return(x+ran)
}
#lapply()
lapply(v,addrand)

#anonymous functions - won't ever name it
  #function(a){code here}

v
lapply(v,function(a){a+sample(x=1:10,1)})



# adds two to every element
lapply(v,function(x){x+2})


#Multiple arguments w/ original function


add_choice <- function(num,choice){
  return(num+choice)
}

add_choice(2,3)
#Error, need to add arguments
lapply(v,add_choice)

#Correct
lapply(v,add_choice,choice=10)


#sapply() - Simplifies process
help(sapply)



# Nice! A vector returned
sapply(v,add_choice,choice=10)



# let's prove it to ourselves
lapp <- lapply(v,add_choice,choice=10)
sapp <- sapply(v,add_choice,choice=10)

class(lapp) # a list
class(sapp) # vector of numerics

#Will not AUTOMATICALLY return vector IF applied function doesn't return all in that vector


# Checks for even numbers
even <- function(x) {
  return(x[(x %% 2 == 0)])
}

nums <- c(1,2,3,4,5)

sapply(nums,even)



lapply(nums,even)

#Math Functions with R

v = c(-1:5)
v
#absolute value
abs(-2)
#sum
sum(v)
#mean
mean(v)
#rounding
round(23.1231)
round(23.1231,2)


#regular expressions - pattern searching, typically in a string/vector of strings


text = "Hi there, do you know who you are voting for?"
#grepl returns logical indicating if pattern was found
grepl('voting',text)
#grpe() returns vector of idnex locations of matching pattern instances
grepl('Hi',text)

grepl('Sammy',text)

v = c('a','b','c','d')
grep('a',v)
grep('c',v)

#timestamps
#System Date
Sys.Date()

#set as a variable
today = Sys.Date()
today

#Can convert to date object through as.date()
#YYYY-MM-DD
as.Date('1990-11-03')

#using Format
as.Date("Nov-03-90",format="%b-%d-%y")



# Using Format
as.Date("November-03-1990",format="%B-%d-%Y")



help(strptime)


#auto adds today's date if not included?
as.POSIXct("11:02:03",format="%H:%M:%S")


as.POSIXct("November-03-1990 11:02:03",format="%B-%d-%Y %H:%M:%S")

#strptime() differs from POSIXct because strptime is a function to convert
#character vectors to POSIXIt format

strptime("11:02:03",format="%H:%M:%S")
