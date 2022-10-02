adult = read.csv('C:\\Users\\lenna\\Downloads\\Coding\\R-for-Data-Science-and-Machine-Learning\\Training Exercises\\Machine Learning Projects\\CSV files for ML Projects\\adult_sal.csv')
print(head(adult))
#remove x column since unneeded
library(dplyr)
adult = select(adult, -X)
head(adult)
str(adult)
summary(adult)

table(adult$type_employer)
#null represented by question mark

#joining parts of data together to reduce number of factors for logi regres
#combine employer type
unemp = function(job){
  #allow string comparisons
  job = as.character(job)
  if (job=='Never-worked'| job == 'Without-pay'){
    return('Unemployed')
  }else{
    return(job)
  }
}

#applying
adult$type_employer = sapply(adult$type_employer,unemp)

print(table(adult$type_employer))

#combine self employed and state an local
group_emp = function(job){
  #checking character strings since already applied unemp function
  if (job=='Local-gov'| job == 'State-gov'){
    return('SL-gov')
  }else if (job=='Self-emp-inc'| job == 'Self-emp-not-inc'){
    return('self-emp')    
  }else{
    return(job)
  }
}

adult$type_employer = sapply(adult$type_employer,group_emp)

print(table(adult$type_employer))

#Marital Status
table(adult$marital)

group_marital <- function(mar){
  mar <- as.character(mar)
  
  # Not-Married
  if (mar=='Separated' | mar=='Divorced' | mar=='Widowed'){
    return('Not-Married')
    
    # Never-Married   
  }else if(mar=='Never-married'){
    return(mar)
    
    #Married
  }else{
    return('Married')
  }
}

adult$marital <- sapply(adult$marital,group_marital)
table(adult$marital)



table(adult$country)
levels(adult$country)



Asia <- c('China','Hong','India','Iran','Cambodia','Japan', 'Laos' ,
          'Philippines' ,'Vietnam' ,'Taiwan', 'Thailand')

North.America <- c('Canada','United-States','Puerto-Rico' )

Europe <- c('England' ,'France', 'Germany' ,'Greece','Holand-Netherlands','Hungary',
            'Ireland','Italy','Poland','Portugal','Scotland','Yugoslavia')

Latin.and.South.America <- c('Columbia','Cuba','Dominican-Republic','Ecuador',
                             'El-Salvador','Guatemala','Haiti','Honduras',
                             'Mexico','Nicaragua','Outlying-US(Guam-USVI-etc)','Peru',
                             'Jamaica','Trinadad&Tobago')
Other <- c('South')



group_country <- function(ctry){
  if (ctry %in% Asia){
    return('Asia')
  }else if (ctry %in% North.America){
    return('North.America')
  }else if (ctry %in% Europe){
    return('Europe')
  }else if (ctry %in% Latin.and.South.America){
    return('Latin.and.South.America')
  }else{
    return('Other')      
  }
}



adult$country <- sapply(adult$country,group_country)



table(adult$country)




str(adult)


#essentially applying factor on columns to convert data type
adult$type_employer <- sapply(adult$type_employer,factor)
adult$country <- sapply(adult$country,factor)
adult$marital <- sapply(adult$marital,factor)



str(adult)

#####
#missing data
#####
library(Amelia)

###
adult[adult=='?'] = NA
###
print(table(adult$type_employer))
###reapply factor to columns
adult$type_employer <- sapply(adult$type_employer,factor)
adult$country <- sapply(adult$country,factor)
adult$marital <- sapply(adult$marital,factor)
###
print(table(adult$type_employer))
###
missmap(adult)
missmap(adult,y.at=c(1),y.labels = c(''),col=c('yellow','black'))

###drop missing data
adult = na.omit(adult)
missmap(adult)
###
library(ggplot2)
library(dplyr)
###
ggplot(adult,aes(age)) + geom_histogram(aes(fill=income),color='black',binwidth = 1) + theme_bw()
###
ggplot(adult,aes(hr_per_week)) + geom_histogram() + theme_bw()
### rename country to region
head(adult)
adult = rename(adult,region = country)
head(adult)
###
pl = ggplot(adult,aes(region)) + geom_bar(aes(fill=income),color='black') + theme_bw()
pl

###
#training and building logistic regression model
#attempt to predict outcome of categorical variables - specifically income earned
###

head(adult)
#train test split
library(caTools)
#
set.seed(101)
#
sample = sample.split(adult$income,SplitRatio = 0.7)
#training data
train = subset(adult,sample==T)
#test
test = subset(adult,sample==F)

help("glm")

#trying to convert income to factor to fix error, making backup, doesnt work lol
adultbackup = adult
adult$income <- sapply(adult$income,factor)
str(adult)
#reassign training data to fix?
#training data
train = subset(adult,sample==T)
#
model = glm(income ~ ., family = binomial(link = 'logit'),data=train)
model = glm(income ~ ., family = binomial(logit), data = train)
summary(model)


#
help(step)
#
new.step.model <- step(model)
warnings()

summary(new.step.model)

test$predicted.income = predict(model, newdata=test, type="response")

table(test$income, test$predicted.income > 0.5)

#model accuracy
(6372+1423)/(6372+1423+548+872)
#recall
6732/(6372+548)
#precision
6732/(6372+872)



