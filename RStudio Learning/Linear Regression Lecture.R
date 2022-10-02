# Read CSV, note the delimiter (sep)
df <- read.csv('C:\\Users\\lenna\\Downloads\\Coding\\R-for-Data-Science-and-Machine-Learning\\Machine Learning with R\\student-mat.csv',sep=';')

head(df)

summary(df)

any(is.na(df))

str(df)

library(ggplot2)
library(ggthemes)
library(dplyr)

# Grab only numeric columns
num.cols <- sapply(df, is.numeric)
num.cols
# Filter to numeric columns for correlation
cor.data <- cor(df[,num.cols])
cor.data


install.packages('corrgram',repos = 'http://cran.us.r-project.org')
install.packages('corrplot',repos = 'http://cran.us.r-project.org')
install.packages('corrgram')
install.packages('corrplot')
library(corrplot)
library(corrgram)

help(corrplot)

corrplot(cor.data,method='color')

corrgram(df,order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt)
                 


ggplot(df,aes(x=G3)) + geom_histogram(bins=20,alpha=0.5,fill='blue') + theme_minimal()

# Import Library
install.packages('caTools')
library(caTools)
# Set a random see so your "random" results are the same as this notebook
set.seed(101) 

# Split up the sample, basically randomly assigns a booleans to a new column "sample"
sample <- sample.split(df$age, SplitRatio = 0.70) # SplitRatio = percent of sample==TRUE

# Training Data
train = subset(df, sample == TRUE)

# Testing Data
test = subset(df, sample == FALSE)



model <- lm(G3 ~ .,train)
summary(model)



# Grab residuals
res <- residuals(model)

# Convert to DataFrame for gglpot
res <- as.data.frame(res)

head(res)



