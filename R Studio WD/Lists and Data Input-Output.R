#list stores variety of data structures in 1 variable
v = c(1,2,3)
ma = matrix(1:10,nrow=2)
df = mtcars

#put all data structures into 1 variable
my.list = list(v,ma,df)

my.list
#each item in list is ordered when you call it
#by number in [[]]

#naming list rather than relying on numbers
my.named.list = list(sample.vec = v,my.matrix = ma,sample.df = df)
my.named.list
#can autofill from below
#my.named.list$

my.list[1]

my.named.list[1]
my.named.list['sample.vec']

class(my.named.list['sample.vec'])
#still a list, to pull it out either use double
#brackets or dollar sign notation
my.named.list$sample.vec
class(my.named.list$sample.vec)

my.named.list[['sample.vec']]
class(my.named.list[['sample.vec']])

#grouping/combining list together
double.list = c(my.named.list,my.named.list)
double.list[[5]]

str(my.named.list)


#Data Input-Output

 #csv files with R
write.csv(mtcars,file = 'my_example.csv')

ex = read.csv('my_example.csv')
head(ex)

write.csv(ex,file = 'insertyourfilenamehere.csv')

install.packages("rJava")

install.packages('readxl')
#library call

library(rJava)

library(readxl)

excel_sheets('Sample-Sales-Data.xlsx')

d = read_excel('Sample-Sales-Data.xlsx',sheet = 'Sheet1')

head(d)
#total sum of value column
sum(d$Value)

#entire workbook into excel
entire.workbook = lapply(excel_sheets('Sample-Sales-Data.xlsx'),read_excel,path='Sample-Sales-Data.xlsx')
#get list of all sheet names, apply read excel to all...
entire.workbook


#writing excel files
install.packages('xlsx')
library(xlsx)
head(mtcars)
#write mtcars into excel file
write.xlsx(mtcars,'output_example.xlsx')


#SQL with R
#general way is through RODBC library
  #specialized package = google "sql database of choice + R"

install.packages('RPostgreSQL')
#help(RPostgreSQL) - doesn't work
??RPostgreSQL

#might be easier to google rather than search documentation
#RPostgreSQL 
#R-blogger page

#web scraping with R
