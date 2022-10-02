install.packages('plotly')
library(ggplot2)
library(plotly)

pl = ggplot(mtcars,aes(mpg,wt)) + geom_point()
print(pl)
#convert into plotly plot - interactive!
gpl = ggplotly(pl)
gpl
