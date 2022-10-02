bike <- read.csv('C:\\Users\\lenna\\Downloads\\Coding\\R-for-Data-Science-and-Machine-Learning\\Training Exercises\\Machine Learning Projects\\CSV files for ML Projects\\bikeshare.csv')


head(bike)

# Count is what we are trying to predict

#1 - scatter plot count vs temp
library(ggplot2)
ggplot(bike,aes(temp,count)) + geom_point(alpha=0.3,aes(color=temp)) + theme_bw()

#2 - count vs datetime

  #converting to POSIXct()
  bike$datetime = as.POSIXct(bike$datetime)
pl = ggplot(bike,aes(datetime,count)) + geom_point(alpha=0.5,aes(color=temp)) + theme_bw()
#adding gradient
pl + scale_color_continuous(low='#55D8CE',high='#FF6E2E') + theme_bw()



#3 - correlation between temp and count
cor(bike[,c('temp','count')])

ggplot(bike,aes(factor(season),count)) + geom_boxplot(aes(color=factor(season))) +theme_bw()



#4 - Feature Engineering
bike$hour <- sapply(bike$datetime,function(x){format(x,"%H")})
head(bike)

library(dplyr)



pl <- ggplot(filter(bike,workingday==1),aes(hour,count)) 
pl <- pl + geom_point(position=position_jitter(w=1, h=0),aes(color=temp),alpha=0.5)
pl <- pl + scale_color_gradientn(colours = c('dark blue','blue','light blue','light green','yellow','orange','red'))
pl + theme_bw()



#5 - nonworking days
pl <- ggplot(filter(bike,workingday==0),aes(hour,count)) 
pl <- pl + geom_point(position=position_jitter(w=1, h=0),aes(color=temp),alpha=0.8)
pl <- pl + scale_color_gradientn(colours = c('dark blue','blue','light blue','light green','yellow','orange','red'))
pl + theme_bw()


#building model with lm()
temp.model <- lm(count~temp,bike)
summary(temp.model)


#6 - Bike rental predict 25 degrees calsius


# Method 1
6.0462 + 9.17*25



# Method 2
temp.test <- data.frame(temp=c(25))
predict(temp.model,temp.test)

#7 sapply()
bike$hour <- sapply(bike$hour,as.numeric)


model <- lm(count ~ . -casual - registered -datetime -atemp,bike )
summary(model)


