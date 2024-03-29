install.packages('ISLR',repos = 'http://cran.us.r-project.org')


library(ISLR)
#
str(Caravan)

summary(Caravan$Purchase)

#cleaning
any(is.na(Caravan))
#no na found

#standardize variables - extreme difference in variance
var(Caravan[,1])
help(var)
var(Caravan[,2])

# save the Purchase column in a separate variable
purchase <- Caravan[,86]

# Standarize the dataset using "scale()" R function
help(scale)
Caravan[,-86]
standardized.Caravan <- scale(Caravan[,-86])
head(standardized.Caravan)

var(standardized.Caravan[,1])

var(standardized.Caravan[,2])




# First 100 rows for test set
test.index <- 1:1000
test.data <- standardized.Caravan[test.index,]
test.purchase <- purchase[test.index]

# Rest of data for training
train.data <- standardized.Caravan[-test.index,]
train.purchase <- purchase[-test.index]







library(class)
set.seed(101)
help(knn)
predicted.purchase <- knn(train.data,test.data,train.purchase,k=1)
head(predicted.purchase)

mean(test.purchase != predicted.purchase)



predicted.purchase <- knn(train.data,test.data,train.purchase,k=3)
mean(test.purchase != predicted.purchase)



predicted.purchase <- knn(train.data,test.data,train.purchase,k=5)
mean(test.purchase != predicted.purchase)



predicted.purchase = NULL
error.rate = NULL

for(i in 1:20){
  set.seed(101)
  predicted.purchase = knn(train.data,test.data,train.purchase,k=i)
  error.rate[i] = mean(test.purchase != predicted.purchase)
}



print(error.rate)




library(ggplot2)

k.values <- 1:20

error.df <- data.frame(error.rate,k.values)

error.df

ggplot(error.df,aes(x=k.values,y=error.rate)) + geom_point()+ geom_line(lty="dotted",color='red')

