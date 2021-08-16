#random data frames built into r
state.x77

USPersonalExpenditure

#labeled rows and labeled columns

women

# data() - see what inbuilt data R has

# See top part(s) of data frame
head(state.x77)
#see bottom part(s) of data frame
tail(state.x77)

#Structure of data frame
str(state.x77)
#50 rows, 8 columns

#summary - statistial data
summary(state.x77)
#Min,Quartiles,Median,Mean,Max

days = c('Mon','Tue','Wed','Thur','Fri')
temp = c(22.2,21,23,24.3,25)
rain = c(T,T,F,F,T)

#pass vectors into data.frame
data.frame(days,temp,rain)
df = data.frame(days,temp,rain)
df
str(df)
summary(df)

#Selection and Indexing
df
df[1,1]
df[,1]
df[1,]
#main point of data frames is name columns and rows
#can index using those names!
df[,'rain']
#Days and Temp Columns, in one!
df[1:5,c('days','temp')]

#Return all values for input
df$days
#Slightly different, in data frame format
df['days']
#days where rain = true
subset(df,subset = rain==TRUE)

subset(df,subset = temp>23)

#ordering data frame - pass in by column to sort by

sorted.temp = order(df['temp'])
sorted.temp

df[sorted.temp,]

desc.temp = order(-df['temp'])
df[desc.temp,]
#same thing
desc.temp = order(-df$temp)
df[desc.temp,]

#DATA FRAME OPERATIONS
#basic, empty data frame
empty = data.frame()
empty
#data frame from vector
c1 = 1:10
#built-in vector of alphabet
letters
c2 = letters[1:10]
df = data.frame(col.name.1 = c1,col.name.2=c2)
df

#importing and exporting data - csv files
write.csv(df,file = 'saved_df.csv')
d2 = read.csv('saved_df.csv')
#extra column called x, the index saved into the csv

#number of rows/columns - doesn't include index
nrow(df)
ncol(df)
#names
colnames(df)
rownames(df)

str(df)
summary(df)

#referencing cells
df
df[[5,2]]
df[[5,'col.name.2']]
#can reassign single cell values
df[[2,'col.name.1']] = 99
df

#referencing rows; no double bracket
df[1,]
   
mtcars
head(mtcars)   
#ctrl l to clear


#get a column back as vector
mtcars$mpg
#other ways
mtcars[,'mpg']
mtcars[['mpg']]

#returns data frame
mtcars['mpg']

#getting multiple columns back as data frame
head(mtcars[c('mpg','cyl')])


#adding rows
df2 = data.frame(col.name.1 = 2000, col.name.2 = 'new')
df2

#use rbind (rowbind) function
dfnew = rbind(df,df2)
df
dfnew

#using $ sign method
df$newcol = 2*df$col.name.1
df

df$newcol.copy = df$newcol
head(df)

df[,'newcol.copy2'] = df$newcol
head(df)

colnames(df)
#rename columns
colnames(df) = c('1','2','3','4','5')
head(df)
#rename single (1st in this case) column
colnames(df)[1] = 'New Col Name'
head(df)


#select 1st 10 rows
df[1:10,]

#select everything but second row
df[-2,]


#conditional selection
head(mtcars)
mtcars[mtcars$mpg>20,]
#need the comma above, requests back certain columns

#multiconditional selection
mtcars[mtcars$mpg>20 & mtcars$cyl == 6,]
mtcars[mtcars$mpg>20 & mtcars$cyl == 6,c('mpg','cyl','hp')]

#same as one of above
subset(mtcars, mpg>20 & mtcars$cyl == 6)


#returns columns 1,2,3
mtcars[,c(1,2,3)]


mtcars[,c('mpg','cyl')]


#dealing with missing data - NA or Null Data
is.na(mtcars)
#check if ANY are NA anywhere in data frame
any(is.na(df))
#check in column specifically
any(is.na(mtcars$mpg))


#replace missing data - in this case with 0
df[is.na(df)] = 0 

