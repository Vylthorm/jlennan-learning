library(ggplot2)
library(ggthemes)
head(mpg)

#1
ggplot(mpg,aes(x=hwy)) + geom_histogram(bins=20,fill='red',alpha=0.5)

#2
ggplot(mpg,aes(x=manufacturer)) + geom_bar(aes(fill=factor(cyl))) + theme_gdocs()


#3
head(txhousing)
ggplot(txhousing,aes(x=sales,y=volume)) + geom_point(color='blue',alpha=0.5)

#4
help(geom_smooth)
ggplot(txhousing,aes(x=sales,y=volume)) + geom_smooth(color='red') + geom_point(color='blue',alpha=0.5)
