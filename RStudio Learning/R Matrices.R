#Obtaining Sequential Vectors/Numbers/Variables...
1:10
x = 1:10

matrix(x)

#set number of rows
matrix(x,nrow = 2)

#matrix filled by column first, num row = 4
matrix(1:12,byrow = FALSE,nrow = 4)
#For Comparison - Fills down row first, rather than column
matrix(1:12,byrow = TRUE,nrow = 4)



goog = c(450,451,452,445,468)
msft = c(230,231,232,233,220)
#combine function
stocks = c(goog,msft)
stocks
#Both valid below
matrix(stocks,nrow = 5)
stock.matrix = matrix(stocks,byrow=TRUE,nrow=2)

print(stock.matrix)
#naming columns and rows
days = c('Mon','Tues','Wed','Thu','Fri')
stocknames = c('GOOG','MSFT')
colnames(stock.matrix) = days
rownames(stock.matrix) = stocknames
print(stock.matrix)


#matrix arithmetic

mat = matrix(1:25,byrow=T,nrow=5)
mat

#multiply all by 2
mat*2
mat/2
mat^2
#reciprocals
1/mat

#filter out values
mat[mat>15]
#using matrices together
mat + mat

mat/mat

mat^mat

mat*mat
#element by element multiplication
#not true matrix multiplication above

#true matrix multiplication
mat %*% mat

#matrix operations
#column sums, case sensitive?
colSums(stock.matrix)
rowSums(stock.matrix)
rowMeans(stock.matrix)

FB = c(111,112,113,120,145)

#Attaching new vector to existing matrix
#rbind to bind as new row
tech.stonks = rbind(stock.matrix,FB)
tech.stonks
#new column
avg = rowMeans(tech.stonks)
avg
#column bind
tech.stonks = cbind(tech.stonks,avg)
tech.stonks

#matrix selection and indexing
v = c(1,2,3,4,5)
v[2]

mat = matrix(1:50,byrow=T,nrow=5)
mat

#selection - first pass in rows, column
mat[1,] #shows everything in first row
mat[1,5] #shows row 1, column 5
mat[,1] #shows first column

#mat[rows,columns]
#grab 3 rows
mat[1:3,]
mat[1:3,1:2]
mat[,9:10]

#factors and categorical matrices
animal = c('d','c','d','c','c')
id = c(1,2,3,4,5)
factor(animal)
fact.ani = factor(animal)
#two levels in the vector (c and d), no order
#nominal and categorical variables
#Nominal = No Order
#Ordinal - There is an order
  #Ordinal in this case below may be temperature
ord.cast = c('cold','med','hot')

temps = c('cold','med','hot','hot','hot','cold','med')
temps
#order
fact.temp = factor(temps,ordered = TRUE,levels = c('cold','med','hot'))
fact.temp = factor(temps,ordered = TRUE,levels = c(ord.cast))
fact.temp

#summary call on object
summary(fact.temp)
summary(temps)
summary(fact.ani)
