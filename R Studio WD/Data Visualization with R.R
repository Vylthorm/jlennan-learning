#ggplot2 - popular data visualization
  #Layer Geometries, Aesthetics, Data, Facets, Statistics, Coordinates, Theme

#Histograms
install.packages('ggplot2')

library(ggplot2)
#movies dataset was moved outside of the package
library(ggplot2movies)

df = movies = movies[sample(nrow(movies),1000),]

head(movies)

#using qplot
qplot(rating,data=df,geom='histogram',binwidth=0.1,alpha=0.8)

#expanding on it using gplot
pl = ggplot(df,aes(x=rating))
pl + geom_histogram(bins=30)

#adding color
pl = ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,color='red',fill='pink')

#Labels


pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,color='red',fill='pink') + xlab('Movie Ratings')+ ylab('Occurences') + ggtitle(' Movie Ratings')

#Changing Alpha (Transparency)
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,fill='blue',alpha=0.4) + xlab('Movie Ratings')+ ylab('Occurences')

#Linetypes - options "blank", "solid", "dashed", "dotted", "dotdash", "longdash", and "twodash". You would never really use these with a histogram, but just to show your options

pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,color='blue',fill='pink',linetype='dotted') + xlab('Movie Ratings')+ ylab('Occurences')

#Advanced Aesthetics
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,aes(fill=..count..)) + xlab('Movie Ratings')+ ylab('Occurences')

#Gradient
pl <- ggplot(df,aes(x=rating))
pl2 <- pl + geom_histogram(binwidth=0.1,aes(fill=..count..)) + xlab('Movie Ratings')+ ylab('Occurences')
pl2 + scale_fill_gradient('Count',low='blue',high='red')

pl2 + scale_fill_gradient('Count',low='darkgreen',high='lightblue')

#Kernel Density Estimation Plot
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(aes(y=..density..),bins=30) + geom_density(color='red')





#Scatterplots
library('ggplot2')
df = mtcars
head(df)

qplot(wt,mpg,data=df)

#Adding 3rd feature, shown by color gradient or resized point based on value of feature
qplot(wt,mpg,data=df,color=cyl)
qplot(wt,mpg,data=df,size=cyl)
  #both
qplot(wt,mpg,data=df,size=cyl,color=cyl)

#four features (little messy)
qplot(wt,mpg,data=df,size=cyl,color=hp,alpha=0.6)


#ggplot
pl <- ggplot(data=df,aes(x = wt,y=mpg)) 
pl + geom_point()
#3rd feature with ggplot
pl <- ggplot(data=df,aes(x = wt,y=mpg)) 
pl + geom_point(aes(color=cyl))

pl <- ggplot(data=df,aes(x = wt,y=mpg))
pl + geom_point(aes(color=factor(cyl)))

pl <- ggplot(data=df,aes(x = wt,y=mpg))
pl + geom_point(aes(size=factor(cyl)))



# With Shapes
pl <- ggplot(data=df,aes(x = wt,y=mpg))
pl + geom_point(aes(shape=factor(cyl)))

pl <- ggplot(data=df,aes(x = wt,y=mpg))
pl + geom_point(aes(shape=factor(cyl),color=factor(cyl)),size=4,alpha=0.6)

#gradient scales
pl + geom_point(aes(colour = hp),size=4) + scale_colour_gradient(high='red',low = "blue")







#barplots
library(ggplot2)

# counts (or sums of weights)
g <- ggplot(mpg, aes(class))
# Number of cars in each class:
g + geom_bar()

# Bar charts are automatically stacked when multiple bars are placed
# at the same location
g + geom_bar(aes(fill = drv))

#can dodge or fill them
g + geom_bar(aes(fill = drv), position = "fill")

g + geom_bar(aes(fill = drv), position = "dodge")





#boxplots
library(ggplot2)
df = mtcars
head(df)

qplot(factor(cyl), mpg, data = mtcars, geom = "boxplot")

#ggplot


pl <- ggplot(mtcars, aes(factor(cyl), mpg))
pl + geom_boxplot()
#coordinate flip
pl + geom_boxplot() + coord_flip()
#color
pl + geom_boxplot(aes(fill = factor(cyl)))
pl + geom_boxplot(fill = "grey", color = "blue")




#2 variable plotting with ggplot2
library(ggplot2)
df = movies

qplot(x=year, y=rating, data = df, geom = "density2d")


pl <- ggplot(movies,aes(x = year,y=rating))
#2d bin chart
pl + geom_bin2d()
#control bin sizes
pl + geom_bin2d(binwidth=c(2,1))
#2d density plot
pl + geom_density2d()
#2d hex plot
pl + geom_hex()
pl + geom_hex() + scale_fill_gradient(high='red',low='blue')



#coordinates and faceting


library(ggplot2)
pl <- ggplot(mpg,aes(x=displ,y=hwy)) + geom_point()

pl

#setting x and y limits
pl + coord_cartesian(xlim=c(1,4),ylim=c(15,30))

#aspect ratios
# aspect ratio, expressed as y / x
pl + coord_fixed(ratio = 1/3)

#facets
help(facet_grid)

p <- ggplot(mpg, aes(displ, cty)) + geom_point()

p + facet_grid(. ~ cyl)

p + facet_grid(drv ~ .)

p + facet_grid(drv ~ cyl)


#themes
library(ggplot2)
df = mtcars
head(df)

pl <- ggplot(df,aes(x=mpg,y=hp)) + geom_point()
print(pl)

pl + theme_bw()
pl + theme_classic()
pl + theme_dark()
pl + theme_get()
pl + theme_light()
pl + theme_linedraw()
pl + theme_minimal()
pl + theme_void()

install.packages('ggthemes')
library(ggthemes)

pl + theme_excel()
pl + theme_economist()
pl + theme_economist_white()


