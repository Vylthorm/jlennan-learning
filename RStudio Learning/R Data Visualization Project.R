library(ggplot2)
install.packages('data.table')
library(data.table)
#1
df <- fread('C:\\Users\\lenna\\Downloads\\Coding\\R-for-Data-Science-and-Machine-Learning\\Training Exercises\\Capstone and Data Viz Projects\\Data Visualization Project\\Economist_Assignment_Data.csv',drop=1)
#2
head(df)
#3
help(ggplot)
pl = ggplot(data = df,aes(x=CPI,y=HDI,color=Region)) + geom_point()
pl

#4
pl = ggplot(data = df,aes(x=CPI,y=HDI,color=Region)) + geom_point(size=4,shape=1)
pl
help(geom_point)

#5
pl = ggplot(data = df,aes(x=CPI,y=HDI,color=Region)) + geom_point(size=4,shape=1) + geom_smooth(aes(group=1)) 
pl

#6
pl2 = ggplot(data = df,aes(x=CPI,y=HDI,color=Region)) + geom_point(size=4,shape=1) + geom_smooth(aes(group=1),method = 'lm',formula = y ~ log(x),se = FALSE,color = 'red') 
pl2

#7
pl2 + geom_text(aes(label=Country))

#8


pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)

pl3

#9
pl4 = pl3 + theme_bw()



#10
pl5 <- pl4 + scale_x_continuous(name = "Corruption Perceptions Index, 2011 (10=least corrupt)",
                                limits = c(.9, 10.5),breaks=1:10) 
pl5

#11


pl6 <- pl5 + scale_y_continuous(name = "Human Development Index, 2011 (1=Best)",
                                limits = c(0.2, 1.0))
pl6


#12


pl6 + ggtitle("Corruption and Human development")

#13


library(ggthemes)
pl6 + theme_economist_white()



