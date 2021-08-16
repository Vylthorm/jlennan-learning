#install.packages('rpart')
library(rpart)

help(rpart)
#Decision Tree
str(kyphosis)
head(kyphosis)

tree = rpart(Kyphosis ~ .,method='class',data=kyphosis)

printcp(tree)



plot(tree, uniform=TRUE, main="Main Title")
text(tree, use.n=TRUE, all=TRUE)

#install.packages('rpart.plot')
library(rpart.plot)

prp(tree)


#random forests
# Random Forest prediction of Kyphosis data
#install.packages('randomForest')
library(randomForest)


model <- randomForest(Kyphosis ~ .,   data=kyphosis)


print(model) # view results

importance(model) # importance of each predictor


