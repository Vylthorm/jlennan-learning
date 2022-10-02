
library(ISLR)

str(iris)
summary(iris)
head(iris)

help(scale)
iris2 = scale(iris[1:4])
head(iris2)
var(iris2[,1])
final.data = cbind(iris2,iris[5])
head(final.data)

#Train and test splits
set.seed(101)

library(caTools)

sample <- sample.split(final.data$Species, SplitRatio = .70)
train <- subset(final.data, sample == TRUE)
test <- subset(final.data, sample == FALSE)
head(test)

library(class)
predicted.species <- knn(train[1:4],test[1:4],train$Species,k=1)
predicted.species

mean(test$Species != predicted.species)


#choosing K value


predicted.species <- NULL
error.rate <- NULL

for(i in 1:10){
  set.seed(101)
  predicted.species <- knn(train[1:4],test[1:4],train$Species,k=i)
  error.rate[i] <- mean(test$Species != predicted.species)
}

library(ggplot2)
k.values <- 1:10
error.df <- data.frame(error.rate,k.values)



pl <- ggplot(error.df,aes(x=k.values,y=error.rate)) + geom_point()
pl + geom_line(lty="dotted",color='red')


