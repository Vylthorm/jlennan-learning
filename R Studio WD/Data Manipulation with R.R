
#Dplyr Guide
install.packages('dplyr')

#REMEMBER: LOOK AT DOCUMENTATION IF YOU FORGET/ARE UNCERTAIN
help(dplyr)
#run it
library(dplyr)

#downloading example data
install.packages('nycflights13',repos = 'http://cran.us.r-project.org')

library(nycflights13)
summary(flights)
#very large data frame
dim(flights)

#filter() allows you to select subset of rows
head(filter(flights,month==11,day==3,carrier=='AA'))

#simpler than dataframe method below
head(flights[flights$month == 11 & flights$day == 3 & flights$carrier == 'AA', ])

#slice() allows us to select rows by position
slice(flights,1:10)

#arrange() reorders rows rather than filtering/selecting them
#providing more than one column name will make the additional columns break ties in values
head(arrange(flights,year,month,day,air_time))

#select() allows for rapid zoom in on a subset
head(select(flights,carrier))

#rename() to rename columns in-place, not reassigned in data structure
head(rename(flights,airline_car=carrier))

#distinct() only returns unique values in a table, works well with select()
distinct(select(flights,carrier))


#mutate() is used to add new columns that are functions of existing columns
head(mutate(flights,new_col=arr_delay-dep_delay))

#transmute() is used if you ONLY want the new columns
head(transmute(flights, new_col = arr_delay-dep_delay))

#summarise() is used to quickly collapse data frames into single rows, able to remove NA values also if set to
summarize(flights,avg_air_time=mean(air_time,na.rm=TRUE))

#sample_n() and sample_frac() used to take random sample of rows, n for fixed number and frac for fixed fraction
sample_n(flights,10)

#.005% of data
sample_frac(flights,0.00005)



#PIPE OPERATOR %>%
df = mtcars
library(dplyr)

#using nesting
arrange(sample_n(filter(df,mpg>20),size=5),desc(mpg))

#using multiple assignments

a = filter(df,mpg>20)
b = sample_n(a,size=5)
c = arrange(b,desc(mpg))
c

#using Pipe Operator
df %>% filter(mpg > 20) %>% sample_n(size = 5) %>% arrange(desc(mpg))



#tidyr - complementary package to create tidy data sets
install.packages('tidyr',repos = 'http://cran.us.r-project.org')
library(tidyr)
#library(data.table)??????????????????????????

#example data set
comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998,1999,2000,1998,1999,2000,1998,1999,2000)
q1 <- runif(9, min=0, max=100)
q2 <- runif(9, min=0, max=100)
q3 <- runif(9, min=0, max=100)
q4 <- runif(9, min=0, max=100)

df <- data.frame(comp=comp,year=yr,Qtr1 = q1,Qtr2 = q2,Qtr3 = q3,Qtr4 = q4)

df

#gather() - collapse columns into key-pair values
  #using pipe operator
head(df %>% gather(Quarter,Revenue,Qtr1:Qtr4))
head(gather(df,Quarter,Revenue,Qtr1:Qtr4))
#spread() complement of gather()


stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocks

stocksm = stocks %>% gather(stock,price,-time)
stocksm %>% spread(stock,price)


#separate() turns single character column into multiple


df <- data.frame(x = c(NA, "a.x", "b.y", "c.z"))
df

df %>% separate(x,c('abc','xyz'))

#unite() pastes together multiple rows into one
head(mtcars)
unite_(mtcars,"vs.am",c('vs','am'),sep=',')

# Separate is the complement of unite
mtcars %>%
  unite(vs_am, vs, am) %>%
  separate(vs_am, c("vs", "am"))
