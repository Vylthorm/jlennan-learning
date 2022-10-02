#1.
age = c(22,25,26)
weight = c(150,165,120)
sex = c('m','m','f')

one = data.frame(age,weight,sex)
names = c('Sam','Frank','Amy')
rownames(one) = names
one

#2
is.data.frame(mtcars)

#3
mat = matrix(1:25,nrow=5)
mat
as.data.frame.matrix(mat)

#4
df = mtcars

#5
head(df)

#6
mean(df[['mpg']])

#OR
mean(df[,'mpg'])

#7
df[df$cyl == 6,]

#8
df[,c('am','gear','carb')]

#9
performance = df[['hp']]/df[['wt']]
df = cbind(df,performance)


#10

round(df[['performance']],2)
df$performance = round(df[['performance']],2)
df


#11
mean(df[df$hp>100 & df$wt > 2.5,'mpg'])

#12
df['Hornet Sportabout','mpg']
