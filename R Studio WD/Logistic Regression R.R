df.train <- read.csv('C:\\Users\\lenna\\Downloads\\Coding\\R-for-Data-Science-and-Machine-Learning\\Machine Learning with R\\titanic_train.csv')

head(df.train)

install.packages('Amelia')

library(Amelia)
help(missmap)
missmap(df.train, main="Titanic Training Data - Missings Map", 
        col=c("yellow", "black"), legend=FALSE)
library(ggplot2)
help(ggplot)
ggplot(df.train,aes(Survived)) + geom_bar()
help(geom_bar)
ggplot(df.train,aes(Pclass)) + geom_bar(aes(fill=factor(Pclass)),alpha=0.5)
help(aes)
ggplot(df.train,aes(Sex)) + geom_bar(aes(fill=factor(Sex)),alpha=0.5)

ggplot(df.train,aes(Age)) + geom_histogram(fill='blue',bins=20,alpha=0.5)

ggplot(df.train,aes(SibSp)) + geom_bar(fill='red',alpha=0.5)

ggplot(df.train,aes(Fare)) + geom_histogram(fill='green',color='black',alpha=0.5)

pl <- ggplot(df.train,aes(Pclass,Age)) + geom_boxplot(aes(group=Pclass,fill=factor(Pclass),alpha=0.4)) 
pl + scale_y_continuous(breaks = seq(min(0), max(80), by = 2))


impute_age <- function(age,class){
  out <- age
  for (i in 1:length(age)){
    
    if (is.na(age[i])){
      
      if (class[i] == 1){
        out[i] <- 37
        
      }else if (class[i] == 2){
        out[i] <- 29
        
      }else{
        out[i] <- 24
      }
    }else{
      out[i]<-age[i]
    }
  }
  return(out)
}

fixed.ages <- impute_age(df.train$Age,df.train$Pclass)

df.train$Age <- fixed.ages




missmap(df.train, main="Titanic Training Data - Missings Map", 
        col=c("yellow", "black"), legend=FALSE)

str(df.train)



head(df.train,3)




library(dplyr)

df.train <- select(df.train,-PassengerId,-Name,-Ticket,-Cabin)

head(df.train,3)

str(df.train)



df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)

str(df.train)
help(factor)
#predict survived, family is a description of error description to be used,
#link=logit = use logistic regression function
log.model <- glm(formula=Survived ~ . , family = binomial(link='logit'),data = df.train)



summary(log.model)
#Starred in summary, i.e. 3 stars are important features


#start with predictions - predict off test data
install.packages('caTools')



library(caTools)
help(set.seed)
set.seed(101)
help(sample.split)
split = sample.split(df.train$Survived, SplitRatio = 0.70)

final.train = subset(df.train, split == TRUE)
final.test = subset(df.train, split == FALSE)

final.log.model <- glm(formula=Survived ~ . , family = binomial(link='logit'),data = final.train)



summary(final.log.model)


help(predict)
fitted.probabilities <- predict(final.log.model,newdata=final.test,type='response')
fitted.probabilities
#short hand way to say if fitted probability> 0.5, set = to 1, otherwise, set to 0
#AKA if over 50% likely to survive, then 1, etc.
fitted.results <- ifelse(fitted.probabilities > 0.5,1,0)
#end up with vector of 0s and 1s)



misClasificError <- mean(fitted.results != final.test$Survived)
#average/number amount of fitted results not equal to true survived values
print(paste('Accuracy',1-misClasificError))
#accuracy of ~80%


#creation of confusion matrix
table(final.test$Survived, fitted.probabilities > 0.5)

